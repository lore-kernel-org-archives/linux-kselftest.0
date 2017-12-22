From: trong at google.com (Tri Vo)
Date: Fri, 22 Dec 2017 14:28:31 -0800
Subject: [Linux-kselftest-mirror] procfs/sysfs test plan
Message-ID: <CAFk4oe1+GcU-q3F_-QndsD6W+QhLGvT+f_x0WyEnUpVOhk65Mw@mail.gmail.com>

Hello,

Android kernel team is planning to develop procfs and sysfs tests and
contribute them to linux-kselftest project. The plan for sysfs tests right now,
as suggested by Greg KH, is to write a minimal "generic" test framework
that allows you to easily specify:
        - file location
        - expected value type (integer, string, range of values, etc.)
        - expected permissions

Could/should this approach be extended to test procfs and other virtual
filesystems? We would really appreciate some input on the test plan. :)

Thanks,
Tri Vo
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
