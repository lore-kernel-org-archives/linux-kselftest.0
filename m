From: gregkh at linuxfoundation.org (Greg Kroah-Hartman)
Date: Mon, 23 Apr 2018 12:45:04 +0200
Subject: [PATCH driver-core 2/2] test_firmware: fix setting old custom fw
 path back on exit, second try
In-Reply-To: <20180418203808.GQ30543@wotan.suse.de>
References: <20180404203712.zecit6po44qsde4c@xylophone.i.decadent.org.uk>
 <20180404203848.3txsangsvaxtxsu4@xylophone.i.decadent.org.uk>
 <20180418203808.GQ30543@wotan.suse.de>
Message-ID: <20180423104504.GA26502@kroah.com>

On Wed, Apr 18, 2018 at 10:38:09PM +0200, Luis R. Rodriguez wrote:
> On Wed, Apr 04, 2018 at 10:38:49PM +0200, Ben Hutchings wrote:
> > Commit 65c79230576 tried to clear the custom firmware path on exit by
> > writing a single space to the firmware_class.path parameter.  This
> > doesn't work because nothing strips this space from the value stored
> > and fw_get_filesystem_firmware() only ignores zero-length paths.
> > 
> > Instead, write a null byte.
> > 
> > Fixes: 0a8adf58475 ("test: add firmware_class loader test")
> > Fixes: 65c79230576 ("test_firmware: fix setting old custom fw path back on exit")
> > Signed-off-by: Ben Hutchings <ben.hutchings at codethink.co.uk>
> 
> Acked-by: Luis R. Rodriguez <mcgrof at kernel.org>
> 
> Greg, let me know if you want to take these two in now, or if you want me to
> queue them up on my own and then send you what I get in the queue later.

I can take them now, thanks.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
