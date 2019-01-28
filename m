From: jeffrin at rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Mon, 28 Jan 2019 23:37:51 +0530
Subject: Fwd: [PATCH] selftests: kmod: worked on errors which breaks the
 overall execution of the test script
In-Reply-To: <CAG=yYwmeGp7fT_3wPpnpHgzFUdYJuFCThUBaPL=DW9e4OZt_BA@mail.gmail.com>
References: <20190117210258.7871-1-jeffrin@rajagiritech.edu.in>
 <20190122194352.GA11489@garbanzo.do-not-panic.com>
 <CAG=yYwmeGp7fT_3wPpnpHgzFUdYJuFCThUBaPL=DW9e4OZt_BA@mail.gmail.com>
Message-ID: <CAG=yYwmjWd5gkkSF+CWQTDPazoctF_D0VALPP8cNX3pZmRS_zg@mail.gmail.com>

---------- Forwarded message ---------
From: Jeffrin Thalakkottoor <jeffrin at rajagiritech.edu.in>
Date: Mon, Jan 28, 2019 at 11:33 PM
Subject: Re: [PATCH] selftests: kmod: worked on errors which breaks
the overall execution of the test script
To: Luis Chamberlain <mcgrof at kernel.org>
Cc: Shuah Khan <shuah at kernel.org>, lkml
<linux-kernel at vger.kernel.org>, <linux-kselftest at vger.kernel.org>,
Andrew Morton <akpm at linux-foundation.org>



>
> on what
> distribution and version of bash does this break?

$cat /etc/issue
Debian GNU/Linux buster/sid \n \l

$
$uname -a
Linux debian 5.0.0-rc1+ #3 SMP Fri Jan 25 21:27:20 IST 2019 x86_64 GNU/Linux
$echo $BASH_VERSION
5.0.0(1)-release
$


>
> The commit log should
> refer to this and it would help me confirm the issue.

i like to send another version of patch which has things in the commit log
>
> > because an array is passed
> Which is the array?

${TEST_DATA#*:*:}
the above stuff sometimes contains array but not initially

>
> get_test_enabled() is supposed to do what you do open-handed here.
> So the better question is why are you getting an array returned
> for your version of bash.
>
iam not returning an array but ${TEST_DATA#*:*:}   sometimes holds array

-- 
software engineer
rajagiri school of engineering and technology
