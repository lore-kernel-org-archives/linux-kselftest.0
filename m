From: gregkh@linuxfoundation.org (Greg KH)
Date: Mon, 17 Sep 2018 09:12:59 +0200
Subject: [GIT PULL] kselftest fixes update for Linux 4.19-rc5
In-Reply-To: <ce9af2b4-86e1-6603-cd36-b900fb583e6f@kernel.org>
References: <ce9af2b4-86e1-6603-cd36-b900fb583e6f@kernel.org>
Message-ID: <20180917071259.GA27405@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180917071259.AnSy2-fpMaj6FUUyR4oq_kOg1axm2retfm4EuafL6Qk@z>

On Sun, Sep 16, 2018@02:22:21PM -0600, Shuah Khan wrote:
> Hi Linus,
> 
> Please pull the following Kselftest update for Linux 4.19-rc5
> 
> linux-kselftest-4.19-rc5
> 
> This Kselftest fixes update for 4.19-rc5 consists of:
> 
> -- fixes to build failures
> -- fixes to add missing config files to increase test coverage
> -- fixes to cgroup test and a new cgroup test for memory.oom.group
> 
> Please note that the selftests: add headers_install to lib.mk patch changes
> the main Makefile. Some tests can't build without headers installed. This 
> fixes such test build failures.

I've merged these now, thanks.

greg k-h
