From: gregkh at linuxfoundation.org (Greg KH)
Date: Thu, 28 Feb 2019 16:45:13 +0100
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190228153741.GA168373@google.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228173444.54403795211d80ba540b61cb@kernel.org>
 <20190228150054.GB156098@google.com>
 <20190228153026.GG8481@kroah.com>
 <20190228153741.GA168373@google.com>
Message-ID: <20190228154513.GA12050@kroah.com>

On Thu, Feb 28, 2019 at 10:37:41AM -0500, Joel Fernandes wrote:
> In any case, it is not practical to provide headers for every kernel version on
> the system image and maintain them, it will take up too much space and has to
> be periodically packaged. Not to mention that there will be kernel versions
> that are booting Android that simply don't have anyone maintaining headers
> for. So the proposed solution is an easier path.

I totally agree with this, and with your proposed patches, just wanting
to clear up some potential anti-GPL-FUD before it got spread any further :)

thanks,

greg k-h
