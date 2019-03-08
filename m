From: gregkh at linuxfoundation.org (Greg KH)
Date: Fri, 8 Mar 2019 15:04:49 +0100
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <05942dfd-b05d-0a26-f8e4-85e2a73b8feb@metux.net>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com>
 <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
 <CAEXW_YQUcA+bnav20tAFQPXYE=epMie4X85diudKs_s-TJ7dsw@mail.gmail.com>
 <05942dfd-b05d-0a26-f8e4-85e2a73b8feb@metux.net>
Message-ID: <20190308140449.GD25768@kroah.com>

On Fri, Mar 08, 2019 at 02:57:24PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 08.03.19 14:42, Joel Fernandes wrote:
> 
> Hi folks,
> 
> > That sounds like it could be useful. I don't see any reason off the
> > top why that would not be possible to add to the list of archived
> > files in the future. The patch allows populating the list of files
> > from Kbuild using ikh_file_list variable.
> 
> It seems the whole thing's going into a direction where a whole own
> subtopic is coming up: compressed built-in filesystem.
> 
> Haven't had a deeper thought about it yet, whether or not existing
> filesystems like squashfs, initramfs, etc are the right thing for that,
> or something new should be invented, but a generic mechanism for
> compiled-in compressed (ro) filesystems could also be interesting
> for very small devices, that perhaps even dont need any persistence.
> 
> Some requirements coming up in mind:
> 
> 1. it shall be possible to have any number of instances - possibly by
>    separate modules.
> 2. it shall be possible to use an bootloader/firmware provided image
>    (so it can serve as initrd)
> 2. data should stay compressed as long as possible, but uncompressed
>    data might be cached - do decompression on-demand
> 3. only needs to be ro (write access could be done via unionfs+friends)
> 4. it shall be swappable (if swap is enabled)
> 
> In that scenario, these in-kernel headers would just one consumer,
> I can imagine lots of others.

I too want a pony :)

Until then, I think this feature should not be bikeshedded to death.  It
fits a real need, is simple (modulo the Kbuild interactions), and is
optional for those that do not wish to waste the memory.

thanks,

greg k-h
