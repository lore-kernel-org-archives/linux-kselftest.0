From: karim.yaghmour@opersys.com (Karim Yaghmour)
Date: Mon, 18 Mar 2019 17:11:45 -0400
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190318185742.109dee5c@alans-desktop>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com> <20190307152303.GA9819@kroah.com>
 <20190318185742.109dee5c@alans-desktop>
Message-ID: <989e8a5c-28a6-856b-5a69-8d84189bcad5@opersys.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318211145.v6ynSOokSoTo8A4g5ABbYWs-42lp-RdPYbxDLt9FmBI@z>


Hi Alan,

On 3/18/19 2:57 PM, Alan Cox wrote:
>> I think the compressed tarball is much simpler/easier overall.  If
>> someone really wants the filesystem, they just uncompress it into a
>> tmpfs mount.  It's much less moving kernel code to worry about.
> 
> There is an even simpler approach. The people who want this for whatever
> strange reason are Android folks. Android lives on flash, so all they have
> to do is put the headers in a flash file system that is updated with the
> kernel and mount it wherever they like. Simple matter of a bit of
> devicetree no ?

The Android use-case scenario might indeed have been the one to best 
crystallize the requirement, but that doesn't mean that all use-cases of 
eBPF wouldn't benefit from this -- which in fact they would, see 
instructions here for example on the need for kernel headers:
https://github.com/iovisor/bcc/blob/master/INSTALL.md

Just a quick $PREFERRED_SEARCH_ENGINE search returns interesting 
exchanges such as this one taken from a discussion thread on LWN 
covering an introduction to eBPF:
https://lwn.net/Articles/741348/
Effectively this person had to be hand-held in understanding that they 
needed a good set of kernel headers to make the tool work. Their comment 
after being shown that this was needed was:
"It looks like the headers package you need on Ubuntu is 
linux-headers-$(uname -r), which contains the entire kernel source tree, 
and is specific to the running kernel."

Surely having Joel's patch in the kernel would obviate the issue for all 
Linux kernel users, not just Android.

Cheers,

-- 
Karim Yaghmour
CEO - Opersys inc. / www.opersys.com
http://twitter.com/karimyaghmour
