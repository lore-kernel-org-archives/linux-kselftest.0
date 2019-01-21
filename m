From: gregkh@linuxfoundation.org (Greg KH)
Date: Mon, 21 Jan 2019 13:22:24 +0100
Subject: [PATCH backport for 4.19] selftests: Fix test errors related to
 lib.mk khdr target
In-Reply-To: <20190116015922.17979-1-shuah@kernel.org>
References: <20190116015922.17979-1-shuah@kernel.org>
Message-ID: <20190121122224.GC15873@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190121122224.TGvO7vhlIrRKbWsby_dXN4Xn3kFVQlOWuVKdWHPFWfA@z>

On Tue, Jan 15, 2019@06:59:21PM -0700, shuah@kernel.org wrote:
> From: Shuah Khan <shuah at kernel.org>
> 
> Upstream commit 211929fd3f7c ("selftests: Fix test errors related to
> lib.mk khdr target")
> 
> This backport drops change to test that isn't in 4.19
> - tools/testing/selftests/tc-testing/bpf/Makefile

Thanks for the backport, now queued up.

greg k-h
