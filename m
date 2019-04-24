From: tycho@tycho.ws (Tycho Andersen)
Date: Wed, 24 Apr 2019 11:11:26 -0600
Subject: [PATCH 1/2] selftests/seccomp: Prepare for exclusive seccomp flags
In-Reply-To: <20190424163756.40001-2-keescook@chromium.org>
References: <20190424163756.40001-1-keescook@chromium.org>
 <20190424163756.40001-2-keescook@chromium.org>
Message-ID: <20190424171126.GM3758@cisco>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424171126.MifbXRzuYRrBDMV_Z1Ah5w0xdq1KWvqE6dTr1Y44Gmw@z>

On Wed, Apr 24, 2019@09:37:55AM -0700, Kees Cook wrote:
> Some seccomp flags will become exclusive, so the selftest needs to
> be adjusted to mask those out and test them individually for the "all
> flags" tests.
> 
> Cc: stable at vger.kernel.org # v5.0+
> Signed-off-by: Kees Cook <keescook at chromium.org>

Whoops, thanks for this too.

Reviewed-by: Tycho Andersen <tycho at tycho.ws>
