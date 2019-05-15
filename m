From: cyphar at cyphar.com (Aleksa Sarai)
Date: Thu, 16 May 2019 00:51:05 +1000
Subject: [PATCH 1/2] pid: add pidfd_open()
In-Reply-To: <20190515141634.lrc5ynllcmjr64mn@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
 <4c5ae46657e1931a832def5645db61eb0bf1accd.camel@opteya.com>
 <20190515141634.lrc5ynllcmjr64mn@brauner.io>
Message-ID: <20190515145105.t7u6v5wxsq2tnbwj@yavin>

On 2019-05-15, Christian Brauner <christian at brauner.io> wrote:
> On Wed, May 15, 2019 at 04:00:20PM +0200, Yann Droneaud wrote:
> > Would it be possible to create file descriptor with "restricted"
> > operation ?
> > 
> > - O_RDONLY: waiting for process completion allowed (for example)
> > - O_WRONLY: sending process signal allowed
> 
> Yes, something like this is likely going to be possible in the future.
> We had discussion around this. But mapping this to O_RDONLY and O_WRONLY
> is not the right model. It makes more sense to have specialized flags
> that restrict actions.

Not to mention that the O_* flags have silly values which we shouldn't
replicate in new syscalls IMHO.

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190516/42a4c65b/attachment-0001.sig>
