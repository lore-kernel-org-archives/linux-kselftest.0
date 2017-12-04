From: gregkh@linuxfoundation.org (Greg KH)
Date: Mon, 4 Dec 2017 08:38:02 +0100
Subject: [Linux-kselftest-mirror] [PATCH] treewide: remove duplicate
	includes
In-Reply-To: <1512337779-16842-1-git-send-email-pravin.shedge4linux@gmail.com>
References: <1512337779-16842-1-git-send-email-pravin.shedge4linux@gmail.com>
Message-ID: <20171204073802.GD19596@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171204073802.8pTJvHBEiNBuGvUnBzjEDXKbmm8iliAXvq5WTkEEn0k@z>

On Mon, Dec 04, 2017@03:19:39AM +0530, Pravin Shedge wrote:
> These duplicate includes have been found with scripts/checkincludes.pl but
> they have been removed manually to avoid removing false positives.
> 
> Unit Testing:
> 
> - build successful
> - LTP testsuite passes.
> - checkpatch.pl passes
> 
> Signed-off-by: Pravin Shedge <pravin.shedge4linux at gmail.com>

Please break this up per-subsystem, like any other cleanup patch, and
send it out that way.  As it is, no one can take such a patch.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
