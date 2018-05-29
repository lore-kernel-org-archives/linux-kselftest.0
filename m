From: kraxel@redhat.com (Gerd Hoffmann)
Date: Tue, 29 May 2018 12:48:55 +0200
Subject: [PATCH v3] Add udmabuf misc device
In-Reply-To: <20180529084406.GI3438@phenom.ffwll.local>
References: <20180525140808.12714-1-kraxel@redhat.com>
 <20180529082327.GF3438@phenom.ffwll.local>
 <20180529084406.GI3438@phenom.ffwll.local>
Message-ID: <20180529104855.vvrfdtbgrsqj27ga@sirius.home.kraxel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180529104855.DfPN2vX01GUbOPegBoxSKonYKnWsYD1ksXLYNWGVU5w@z>

  Hi,

> > > qemu test branch:
> > >   https://git.kraxel.org/cgit/qemu/log/?h=sirius/udmabuf
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> > > +	if (!shmem_mapping(file_inode(ubuf->filp)->i_mapping))
> > > +		goto err_free_ubuf;
> 
> Can/should we test here that the memfd has a locked down size here?

Makes sense.  Suggested way to check that?  unstatic memfd_get_seals()
function (mm/shmem.c)?  Or is there some better way?

Also which seals should we require?  Is F_SEAL_SHRINK enough?

> On that: Link to userspace patches/git tree using this would be nice.

See above.

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
