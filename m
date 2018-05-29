From: daniel.vetter@ffwll.ch (Daniel Vetter)
Date: Tue, 29 May 2018 14:29:43 +0200
Subject: [Linaro-mm-sig] [PATCH v3] Add udmabuf misc device
In-Reply-To: <20180529104855.vvrfdtbgrsqj27ga@sirius.home.kraxel.org>
References: <20180525140808.12714-1-kraxel@redhat.com>
 <20180529082327.GF3438@phenom.ffwll.local>
 <20180529084406.GI3438@phenom.ffwll.local>
 <20180529104855.vvrfdtbgrsqj27ga@sirius.home.kraxel.org>
Message-ID:
 <CAKMK7uEUrgKkmPTtku5otN++H3SW7xLaGEn0S9nGEpGAA_Uy+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180529122943.e4RnDPR9KsythMp8efanO3dmXeok82QySuquJdGj3Io@z>

On Tue, May 29, 2018@12:48 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>   Hi,
>
>> > > qemu test branch:
>> > >   https://git.kraxel.org/cgit/qemu/log/?h=sirius/udmabuf
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>> > > + if (!shmem_mapping(file_inode(ubuf->filp)->i_mapping))
>> > > +         goto err_free_ubuf;
>>
>> Can/should we test here that the memfd has a locked down size here?
>
> Makes sense.  Suggested way to check that?  unstatic memfd_get_seals()
> function (mm/shmem.c)?  Or is there some better way?
>
> Also which seals should we require?  Is F_SEAL_SHRINK enough?

Yes I think that's enough.

Hm ... I think we also need to prevent the F_SEAL_WRITE, because
there's no way to stop dma from tampering with the buffer once it's a
dma-buf. Otherwise evil userspace could create a memfd, F_SEAL_SHRINK
it, make a dma-buf out of it, F_SEAL_WRITE it, hand it to some
unsuspecting priviledged service and then pull it over the table with
a few dma-buf writes.

>> On that: Link to userspace patches/git tree using this would be nice.
>
> See above.

Ow, I was blind :-)

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
