package top.lw33.bbs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import top.lw33.bbs.config.Config;
import top.lw33.bbs.pojo.User;
import top.lw33.bbs.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    UserService userService;


    @RequestMapping("/test")
    @ResponseBody
    public User test() {
        return userService.selectByUserId(1);
    }


   /* @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String logi() {
        return "login";
    }*/

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, HttpServletRequest request, HttpServletResponse response) {
        //System.out.println(user);
        User login = userService.login(user);
        if (login != null) {
            request.getSession().setAttribute("user", login);
            return "redirect:/index";

        }
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("<script>alert('用户名或者密码错误！');location.href='/index'</script>\n");
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }


    @RequestMapping("/register")
    public void register(User user, HttpServletRequest request, HttpServletResponse response)  {

        if (StringUtils.isBlank(user.getPasswd()) || StringUtils.isBlank(user.getName())) {
            try {

                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("<script>alert('注册失败，用户名与密码不能为空');location.href='/index'</script>\n");
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (userService.selectUserByName(user.getName()) == null) {
            User register = userService.register(user);
            if (register != null) {
                request.getSession().setAttribute("user", register);
                try {

                    response.setContentType("text/html;charset=utf-8");
                    response.getWriter().print("<script>alert('注册成功');location.href='/index'</script>\n");
                    return;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else {
                try {
                    response.setContentType("text/html;charset=utf-8");
                    response.getWriter().print("<script>alert('注册失败');location.href='/index'</script>\n");
                    return;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        } else {
            try {

                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("<script>alert('注册失败，用户名可能存在');location.href='/index'</script>\n");

                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.invalidate();
        return "redirect:/index";
    }

    @RequestMapping("/user/manage/{pageNum}")
    public ModelAndView getUsers(ModelAndView modelAndView, @PathVariable("pageNum")Integer pageNum, HttpSession session){

        if (pageNum == null) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, Config.PAGESIZE);//当前页，页面大小
        //紧跟着的第一个select方法会被分页
        User user = (User) session.getAttribute("user");
        if (user == null) {
            modelAndView.setViewName("redirect:/index");
            return modelAndView;
        }
        List<User> users = userService.selectUsers();

        //articles.forEach(article -> System.out.println(article.getAuthor().getName()));


        PageInfo<User> pageInfo=new PageInfo<>(users);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("users", users);
        modelAndView.addObject("index", 3);
        modelAndView.setViewName("userManager");
        return modelAndView;
    }

    @RequestMapping("/user/add")
    public void add(User user, HttpServletResponse response) {
        if (StringUtils.isBlank(user.getPasswd()) || StringUtils.isBlank(user.getName())) {
            try {

                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("<script>alert('添加失败，用户名与密码不能为空');location.href='/index'</script>\n");
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (userService.selectUserByName(user.getName()) == null) {
            userService.register(user);
            try {

                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("<script>alert('添加成功');location.href='/user/manage/1'</script>\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {

                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("<script>alert('添加失败，用户名可能存在');location.href='/user/manage/1'</script>\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping("/user/delete")
    @ResponseBody
    public int delete(Integer uid) {
        if (uid == null) {
            return 0;
        }
        int i = userService.deleteUserByUid(uid);
        if (i > 0) {
            return 1;
        }
        return 0;
    }



    @RequestMapping("/user/showChangeUser/{uid}")
    @ResponseBody
    public User article(@PathVariable("uid") Integer uid) {
        if (uid != null) {
            User user= userService.selectByUserId(uid);
            return user;
        }
        return null;
    }

    @RequestMapping("/user/updateUser")
    public void updateUser(User user, HttpSession session, HttpServletResponse response) {

        if (((User) session.getAttribute("user")).getIsadmin() == 0) {
            try {

                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("<script>alert('修改失败');location.href='/user/manage/1'</script>\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }
        int i = userService.updateUser(user);
        if (i > 0) {
            try {

                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("<script>alert('修改成功');location.href='/user/manage/1'</script>\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {

                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("<script>alert('修改失败');location.href='/user/manage/1'</script>\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    @RequestMapping("/user/changeInfo")
    public String changeInfo(Model model, HttpSession session) {
        model.addAttribute("index", 4);
        User user = userService.selectByUserId(((User) session.getAttribute("user")).getUid());
        String sgender = user.getGender();
        int gender = 0;
        if ("男".equals(sgender)) {
            gender = 1;
        }

        model.addAttribute("gender", gender);
        model.addAttribute("userInfo", user);
        return "changeUserInfo";
    }
    @RequestMapping("/user/info/{uid}")
    public String userInfo(Model model, @PathVariable("uid") Integer uid) {
        model.addAttribute("index", 666);
        User user = userService.selectByUserId(uid);
        user.setPasswd(null);
        model.addAttribute("userInfo", user);
        return "user/userInfo";
    }

    //图片上传用MultipartFile接收文件
    @RequestMapping("/user/updateInfo")
    public String updateItem(Model model, @RequestParam("inputfile")MultipartFile picFile, HttpServletRequest request, HttpSession session) throws Exception {
        User user = new User();
        user.setUid(((User)session.getAttribute("user")).getUid());
        user.setName(StringUtils.isNotBlank(request.getParameter("name")) ? request.getParameter("name") : null);
        user.setPasswd(StringUtils.isNotBlank(request.getParameter("passwd"))?request.getParameter("passwd"): null);
        user.setTel(StringUtils.isNotBlank(request.getParameter("tel")) ? request.getParameter("tel") : null);
        //user.setGender(StringUtils.isNotBlank(request.getParameter("gender")) ? request.getParameter("gender") : null);
        user.setBirth(StringUtils.isNotBlank(request.getParameter("birth")) ? new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birth")) : null);
        System.out.println(request.getParameter("birth"));
        System.out.println(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birth")));
        user.setVocation(StringUtils.isNotBlank(request.getParameter("vocation")) ? request.getParameter("vocation") : null);
        user.setAddress(StringUtils.isNotBlank(request.getParameter("address")) ? request.getParameter("address") : null);
        user.setIntroduction(StringUtils.isNotBlank(request.getParameter("introduction")) ? request.getParameter("introduction") : null);
        int gender = Integer.parseInt(request.getParameter("gender"));
        if (gender == 1) {
            user.setGender("男");
            model.addAttribute("gender", 1);
        } else {
            user.setGender("女");
            model.addAttribute("gender", 0);
        }

        if (!picFile.isEmpty()) {


        // 图片新名字
        String name = UUID.randomUUID().toString();
        // 图片原名字
        String oldName = picFile.getOriginalFilename();
        // 后缀名
        String exeName = oldName.substring(oldName.lastIndexOf("."));

            if (exeName == null) {
                exeName = "jpg";
            }
        String fileName = name + exeName;
        String filePath=request.getServletContext().getRealPath(Config.DEFAULT_UPLOAD_ADDRESS);
        try{
            picFile.transferTo(new File(filePath+fileName));
            user.setProfile(Config.HEADIMG_ADDRESS + fileName);
        }catch (Exception e) {
            e.printStackTrace();
        }
        }
        userService.updateUser(user);
        User user1 = userService.selectByUserId(user.getUid());
        User user2 = new User();
        BeanUtils.copyProperties(user1, user2);
        model.addAttribute("userInfo", user2);
        user1.setPasswd("");
        session.setAttribute("user", user1);
       return "changeUserInfo";
    }


}
