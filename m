From: jmorris at namei.org (James Morris)
Date: Thu, 25 Apr 2019 15:30:41 +1000 (AEST)
Subject: [PATCH 2/2] seccomp: Make NEW_LISTENER and TSYNC flags exclusive
In-Reply-To: <20190424163756.40001-3-keescook@chromium.org>
References: <20190424163756.40001-1-keescook@chromium.org>
 <20190424163756.40001-3-keescook@chromium.org>
Message-ID: <alpine.LRH.2.21.1904251530200.26472@namei.org>

On Wed, 24 Apr 2019, Kees Cook wrote:

> Reported-by: syzbot+b562969adb2e04af3442 at syzkaller.appspotmail.com
> Fixes: 6a21cc50f0c7 ("seccomp: add a return code to trap to userspace")
> CC: stable at vger.kernel.org # v5.0+
> Signed-off-by: Tycho Andersen <tycho at tycho.ws>
> Signed-off-by: Kees Cook <keescook at chromium.org>


Acked-by: James Morris <jamorris at linux.microsoft.com>


-- 
James Morris
<jmorris at namei.org>
