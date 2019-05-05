From: gregkh at linuxfoundation.org (Greg KH)
Date: Sun, 5 May 2019 11:10:30 +0200
Subject: [PATCH v2] kheaders: Move from proc to sysfs
In-Reply-To: <20190504123650.GA229151@google.com>
References: <20190504121213.183203-1-joel@joelfernandes.org>
 <20190504122158.GA23535@kroah.com>
 <20190504123650.GA229151@google.com>
Message-ID: <20190505091030.GA25646@kroah.com>

On Sat, May 04, 2019 at 08:36:50AM -0400, Joel Fernandes wrote:
> > But, you should change S_IRUGO to the correct octal number, checkpatch
> > should have barfed on this change.
> 
> fixed, below is the updated patch inline, thanks!

Please resend as a "real" submission, doing so in this format is a bit
more difficult to apply.

thanks,

greg k-h
