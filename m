From: mcgrof at kernel.org (Luis R. Rodriguez)
Date: Thu, 22 Feb 2018 19:50:47 +0000
Subject: [PATCH] selftest: fix kselftest-merge depend on
 'RUNTIME_TESTING_MENU'
In-Reply-To: <20180222115307.15063-1-zongbox@gmail.com>
References: <20180222115307.15063-1-zongbox@gmail.com>
Message-ID: <20180222195047.GC27055@wotan.suse.de>

On Thu, Feb 22, 2018 at 07:53:07PM +0800, Zong Li wrote:
> Since the 'commit d3deafaa8b5c ("lib/: make RUNTIME_TESTS a menuconfig
> to ease disabling it all")', the make kselftest-merge cannot merge the
> config dependencies of kselftest to the existing .config file.
> 
> These config dependencies of kselftest need to enable the
> 'CONFIG_RUNTIME_TESTING_MENU=y' at the same time.
> 
> Signed-off-by: Zong Li <zong at andestech.com>
> Cc: Greentime Hu <greentime at andestech.com>

Please add respective Fixes: tag with the sha1sum, and commit name.

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
