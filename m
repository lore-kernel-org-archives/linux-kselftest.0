From: gregkh@linuxfoundation.org (Greg KH)
Date: Thu, 4 Oct 2018 12:29:22 -0700
Subject: [PATCH backport for 4.18] rseq/selftests: fix parametrized test
 with -fpie
In-Reply-To: <20181004190430.812-1-mathieu.desnoyers@efficios.com>
References: <20181004190430.812-1-mathieu.desnoyers@efficios.com>
Message-ID: <20181004192922.GC9909@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181004192922.mQdGyRsYaASvssf5W6YeWuBfrLEpDDHETQwYuSOU6v0@z>

On Thu, Oct 04, 2018@03:04:30PM -0400, Mathieu Desnoyers wrote:
> commit ce01a1575f45bf319e374592656441021a7f5823 upstream.

Thanks, that worked.

greg k-h
