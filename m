Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8119221CC4F
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 00:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776212142; cv=pass; b=JoJOS/FCTt3fng1XnT1rOjB7H+3lHy1To6VznKE+Md9xWC9sApNsyr+1Sfoqzl6wUF8Qktj/RK0+YtyoggI/5lmixW4lsWVcnXp/GazX43f7rIdepHhCdJv8NlWi1VMdqqWwUALVIMkSw/xAO6OBfeyTI/TqRS0GljmPOv3EA8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776212142; c=relaxed/simple;
	bh=GjXuQoJnZpo3MLX6LJo8M6nOHZuDmGmUwYAG0XcMSyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJi1qnhMSnVIbSjriIQunFrEu4Cz45/MSP8D2XIHGDJgkJDfdt/InK6eNqHYxd/MvnnRNPCGLTFT330o8d9XeKRVxu9qNy5JtE7zoRQlxOPvwyuUzmtg8h2daNHXN2TubQOu3UWjuK3tlGgQa9D0XZjf/EMKwhXlEbM86vOGIgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=IHtKByUi; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="IHtKByUi"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6715006f4f7so4565459a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 17:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776212138; cv=none;
        d=google.com; s=arc-20240605;
        b=fcFhS7I3sLqwAQR8CsInbugYKvY4e9SLfSUeH9QMuhW9XxqoFjt32ywFATH3y5KxKK
         tjNUf4GEThCH1NZpN/zcqW6uAL/4+nGieSTXWahDPXUJnCUYNqq7jY0bnKFMsfjjm6bF
         yNBqu6Z6GsNAZ0zD2H5/4sFiw2UHJkWkmuz+gVCe/6d94RVYKznVZmltwvX0F3oT9Teo
         6HSYUiF0mPjEMix7WKFYlZS+OKS2TftZQWL7Eh4o6/QOefiiGrtuHwUUc4hHw6k0NGgi
         iHqyrKWj7xUd5DGRl06paCFw2UC8am1yVNs4+6Odc/JJzbhUg/PmX+Zx0ndlk+xzCJWL
         PPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X75Z8jcIm7WVjsDYz+mTEljAfNH1stn3Xmye0egk8hM=;
        fh=R1HkEYSTsNrQMjZ0rlm6SScKOVybI3XxDN4kP/vBWCw=;
        b=ED27JDpRRJoW6TglhVCPk9brHioz4Ar8BWB4ok/exY21pifakuo2N3IFDOEeCC/+9A
         HUVlu3V5HDGwhrMStmX0XDhpXEA2tuW8Pa+ziCodeUsnrSzKKCg1m7SBBjtk7RrwwlkC
         J/TsccDLvdbfjnWKwzUcVE1wvGCAQqRAiGzuQ0Yg8KtIuhu9Jqfnhve1Bovi2SfLiOD3
         LA8DpynCYSZNOu3IKrfV3Uv/q5o2OWNV2fwwWfFC+pu4bW8RiUDh2eNLGggWreAdkOCo
         VVzTB5KMJeo7rHwp3gDpx2UKJETZDt+AtYfH8ApXkl1Xb9EBlQ/H16KUKJGyM6LB2i9E
         WtQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1776212138; x=1776816938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X75Z8jcIm7WVjsDYz+mTEljAfNH1stn3Xmye0egk8hM=;
        b=IHtKByUidAg9A05PN1hvZ4PY8uvqoyu7ADjDKbUvevcEv7hZ39UqgzoktAhEP+ZU3S
         NHyhwlkVRfEkpBA/HZnjEigKZLRTyfHwSdlf2Dd1C3hl+PhT8Get2NAsSybMDImeSTBR
         3cdi5XpXFHiiSYo+8/JkxNO6tEo5qfLbfsuwc39puWnoV5W83/l3Y8S75ZOpUQqS7lhx
         x0ROpxSjnIsljmp4VlH3hBzXjL9HgXq0wiuOgjUYfGrOaQ0him8Fp8K95rR465yyx80Y
         AvDzYpo+T3b8YrgfR0O4fsX8Rr9nTTPVBUmpMJjSakZ8cxhwY7apcEvypzfL+8Qv1L19
         Uk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776212138; x=1776816938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X75Z8jcIm7WVjsDYz+mTEljAfNH1stn3Xmye0egk8hM=;
        b=B2NgOFUHihL4OMLgtvTtkAYmkv5kEEx/COZMV8gUwjzPSb2EWKvEJ5xQjRuohd0CPC
         E2C/fsxmSj9fxdJcaTqDQ/zWPQL49Vcp/kqBYGM9fJVuFAMuDv2R1M7EnjxsTPiCxP7J
         NsN+k7P4CtAETEmoy4oHGOIc3y5hVnvMYaA5qVwo4XXcvXKQ2BPotGRmVZo1PvAt0lJ+
         sF1v4ZNzwOqRVxbPpbodGjlwVJjjNmy4ak0rBnDGT1UFx2KB3Gup8BaC0RpBc0duaZWC
         G3euz8zMMDpkpFTrkVtUs0A9Xy6xkw5Y4IUWJO/Gh91pHEdMizrJ5GmZLKM5VpluCTD6
         plvA==
X-Gm-Message-State: AOJu0Yy5roGLgwCy0MnahveRYOtyCo2UanupbpAmTWTkFxghsUBoUfFU
	tfCa9wky3vlD0jNvQKKzuAQGMh6cjKec9pjSNpvMyWBVY737PmtSNIuLQC9WKsXNes/CDkHqMR+
	deZYc7jDC5bx75cSOozN0b7Eact68EhL9oy25dCYGPg==
X-Gm-Gg: AeBDieuAEx5TvtujSTutcOTDyJqGInY+hLztZf9UMTkjgJIJrrhaPGUxOnrhEv2oPmF
	0A3Na0QMl6oWyKb9w99EmRfz/nxb99NM/Qqx67ZftDPgWO/nfkZoBmVWl1DbZdQNa9ZbxoItTp9
	cZdvDzTWjbIJ2fIHpaIZpF9/oyBfKrxRdr3Q3Mr8aEso0T6wug4GL4et+wDeVj/9rO+ABdIwv8C
	ara9TKJ8koroTmImmama2yHQvdIOToKc4mMq2Q8fD7sJghICkAMF+Go5WD11Eh6g+bDOE3fL0SJ
	niylKQzZSAHXQ8+O3GJpqqo5Fn5ndEDK22QG3A==
X-Received: by 2002:a05:6402:35ca:b0:670:a244:6ee9 with SMTP id
 4fb4d7f45d1cf-670a2446f7cmr10318864a12.14.1776212137632; Tue, 14 Apr 2026
 17:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
 <20260414200237.444170-2-pasha.tatashin@soleen.com> <4bd21077-8711-4ae7-a695-8bc88ce652d1@linux.dev>
In-Reply-To: <4bd21077-8711-4ae7-a695-8bc88ce652d1@linux.dev>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 14 Apr 2026 20:14:59 -0400
X-Gm-Features: AQROBzCqSdJAuuwFhMpg63uCqaqFdKnCS6dn7LU4ts91W7LOTb_CczDFycGjSW8
Message-ID: <CA+CK2bDvFQUYCsD+jKBWw1KfRNJ4DOopAu29iq7SWYrPWV+dzQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] liveupdate: Remove limit on the number of sessions
To: "yanjun.zhu" <yanjun.zhu@linux.dev>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
	skhawaja@google.com, graf@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 8:06=E2=80=AFPM yanjun.zhu <yanjun.zhu@linux.dev> w=
rote:
>
> On 4/14/26 1:02 PM, Pasha Tatashin wrote:
> > Currently, the number of LUO sessions is limited by a fixed number of
> > pre-allocated pages for serialization (16 pages, allowing for ~819
> > sessions).
> >
> > This limitation is problematic if LUO is used to support things such as
> > systemd file descriptor store, and would be used not just as VM memory
> > but to save other states on the machine.
> >
> > Remove this limit by transitioning to a linked-block approach for
> > session metadata serialization. Instead of a single contiguous block,
> > session metadata is now stored in a chain of 16-page blocks. Each block
> > starts with a header containing the physical address of the next block
> > and the number of session entries in the current block.
> >
> > - Bump session ABI version to v3.
> > - Update struct luo_session_header_ser to include a 'next' pointer.
> > - Implement dynamic block allocation in luo_session_insert().
> > - Update setup, serialization, and deserialization logic to traverse
> >    the block chain.
> > - Remove LUO_SESSION_MAX limit.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >   include/linux/kho/abi/luo.h      |  19 +--
> >   kernel/liveupdate/luo_internal.h |  12 +-
> >   kernel/liveupdate/luo_session.c  | 237 +++++++++++++++++++++++-------=
-
> >   3 files changed, 197 insertions(+), 71 deletions(-)
> >
> > diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
> > index 46750a0ddf88..f5732958545e 100644
> > --- a/include/linux/kho/abi/luo.h
> > +++ b/include/linux/kho/abi/luo.h
> > @@ -57,9 +57,10 @@
> >    *   - compatible: "luo-session-v1"
> >    *     Identifies the session ABI version.
> >    *   - luo-session-header: u64
> > - *     The physical address of a `struct luo_session_header_ser`. This=
 structure
> > - *     is the header for a contiguous block of memory containing an ar=
ray of
> > - *     `struct luo_session_ser`, one for each preserved session.
> > + *     The physical address of the first `struct luo_session_header_se=
r`.
> > + *     This structure is the header for a block of memory containing a=
n array
> > + *     of `struct luo_session_ser` entries. Multiple blocks are linked=
 via
> > + *     the `next` field in the header.
> >    *
> >    * File-Lifecycle-Bound Node (luo-flb):
> >    *   This node describes all preserved global objects whose lifecycle=
 is bound
> > @@ -77,9 +78,9 @@
> >    *   `__packed` structures. These structures contain the actual prese=
rved state.
> >    *
> >    *   - struct luo_session_header_ser:
> > - *     Header for the session array. Contains the total page count of =
the
> > - *     preserved memory block and the number of `struct luo_session_se=
r`
> > - *     entries that follow.
> > + *     Header for the session data block. Contains the physical addres=
s of the
> > + *     next session data block and the number of `struct luo_session_s=
er`
> > + *     entries that follow this header in the current block.
> >    *
> >    *   - struct luo_session_ser:
> >    *     Metadata for a single session, including its name and a physic=
al pointer
> > @@ -153,21 +154,23 @@ struct luo_file_set_ser {
> >    *                          luo_session_header_ser
> >    */
> >   #define LUO_FDT_SESSION_NODE_NAME   "luo-session"
> > -#define LUO_FDT_SESSION_COMPATIBLE   "luo-session-v2"
> > +#define LUO_FDT_SESSION_COMPATIBLE   "luo-session-v3"
> >   #define LUO_FDT_SESSION_HEADER              "luo-session-header"
> >
> >   /**
> >    * struct luo_session_header_ser - Header for the serialized session =
data block.
> > + * @next:  Physical address of the next struct luo_session_header_ser.
> >    * @count: The number of `struct luo_session_ser` entries that immedi=
ately
> >    *         follow this header in the memory block.
> >    *
> > - * This structure is located at the beginning of a contiguous block of
> > + * This structure is located at the beginning of a block of
> >    * physical memory preserved across the kexec. It provides the necess=
ary
> >    * metadata to interpret the array of session entries that follow.
> >    *
> >    * If this structure is modified, `LUO_FDT_SESSION_COMPATIBLE` must b=
e updated.
> >    */
> >   struct luo_session_header_ser {
> > +     u64 next;
> >       u64 count;
> >   } __packed;
> >
> > diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_i=
nternal.h
> > index 875844d7a41d..a73f42069301 100644
> > --- a/kernel/liveupdate/luo_internal.h
> > +++ b/kernel/liveupdate/luo_internal.h
> > @@ -11,6 +11,16 @@
> >   #include <linux/liveupdate.h>
> >   #include <linux/uaccess.h>
> >
> > +/*
> > + * Safeguard limit for the number of serialization blocks. This is use=
d to
> > + * prevent infinite loops and excessive memory allocation in case of m=
emory
> > + * corruption in the preserved state.
> > + *
> > + * This limit allows for ~8.1 million sessions and ~1.2 million files =
per
> > + * session, which is more than enough for all realistic use cases.
> > + */
> > +#define LUO_MAX_BLOCKS 10000
> > +
> >   struct luo_ucmd {
> >       void __user *ubuffer;
> >       u32 user_size;
> > @@ -59,7 +69,6 @@ struct luo_file_set {
> >    * struct luo_session - Represents an active or incoming Live Update =
session.
> >    * @name:       A unique name for this session, used for identificati=
on and
> >    *              retrieval.
> > - * @ser:        Pointer to the serialized data for this session.
> >    * @list:       A list_head member used to link this session into a g=
lobal list
> >    *              of either outgoing (to be preserved) or incoming (res=
tored from
> >    *              previous kernel) sessions.
> > @@ -70,7 +79,6 @@ struct luo_file_set {
> >    */
> >   struct luo_session {
> >       char name[LIVEUPDATE_SESSION_NAME_LENGTH];
> > -     struct luo_session_ser *ser;
> >       struct list_head list;
> >       bool retrieved;
> >       struct luo_file_set file_set;
> > diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_se=
ssion.c
> > index 92b1af791889..007ca34eba79 100644
> > --- a/kernel/liveupdate/luo_session.c
> > +++ b/kernel/liveupdate/luo_session.c
> > @@ -69,30 +69,39 @@
> >   #include <uapi/linux/liveupdate.h>
> >   #include "luo_internal.h"
> >
> > -/* 16 4K pages, give space for 744 sessions */
> > +/* 16 4K pages, give space for 819 sessions per block */
> >   #define LUO_SESSION_PGCNT   16ul
> > -#define LUO_SESSION_MAX              (((LUO_SESSION_PGCNT << PAGE_SHIF=
T) -   \
> > +#define LUO_SESSION_BLOCK_MAX                (((LUO_SESSION_PGCNT << P=
AGE_SHIFT) -   \
> >               sizeof(struct luo_session_header_ser)) /                \
> >               sizeof(struct luo_session_ser))
> >
> > +/**
> > + * struct luo_session_block - Internal representation of a session ser=
ialization block.
> > + * @list: List head for linking blocks in memory.
> > + * @ser:  Pointer to the serialized header in preserved memory.
> > + */
> > +struct luo_session_block {
> > +     struct list_head list;
> > +     struct luo_session_header_ser *ser;
> > +};
> > +
> >   /**
> >    * struct luo_session_header - Header struct for managing LUO session=
s.
> >    * @count:      The number of sessions currently tracked in the @list=
.
> > + * @nblocks:    The number of allocated serialization blocks.
> >    * @list:       The head of the linked list of `struct luo_session` i=
nstances.
> >    * @rwsem:      A read-write semaphore providing synchronized access =
to the
> >    *              session list and other fields in this structure.
> > - * @header_ser: The header data of serialization array.
> > - * @ser:        The serialized session data (an array of
> > - *              `struct luo_session_ser`).
> > + * @blocks:     The list of serialization blocks (struct luo_session_b=
lock).
> >    * @active:     Set to true when first initialized. If previous kerne=
l did not
> >    *              send session data, active stays false for incoming.
> >    */
> >   struct luo_session_header {
> >       long count;
> > +     long nblocks;
> >       struct list_head list;
> >       struct rw_semaphore rwsem;
> > -     struct luo_session_header_ser *header_ser;
> > -     struct luo_session_ser *ser;
> > +     struct list_head blocks;
> >       bool active;
> >   };
> >
> > @@ -110,10 +119,12 @@ static struct luo_session_global luo_session_glob=
al =3D {
> >       .incoming =3D {
> >               .list =3D LIST_HEAD_INIT(luo_session_global.incoming.list=
),
> >               .rwsem =3D __RWSEM_INITIALIZER(luo_session_global.incomin=
g.rwsem),
> > +             .blocks =3D LIST_HEAD_INIT(luo_session_global.incoming.bl=
ocks),
> >       },
> >       .outgoing =3D {
> >               .list =3D LIST_HEAD_INIT(luo_session_global.outgoing.list=
),
> >               .rwsem =3D __RWSEM_INITIALIZER(luo_session_global.outgoin=
g.rwsem),
> > +             .blocks =3D LIST_HEAD_INIT(luo_session_global.outgoing.bl=
ocks),
> >       },
> >   };
> >
> > @@ -140,6 +151,70 @@ static void luo_session_free(struct luo_session *s=
ession)
> >       kfree(session);
> >   }
> >
> > +static int luo_session_add_block(struct luo_session_header *sh,
> > +                              struct luo_session_header_ser *ser)
> > +{
> > +     struct luo_session_block *block;
> > +
> > +     if (sh->nblocks >=3D LUO_MAX_BLOCKS)
> > +             return -ENOSPC;
> > +
> > +     block =3D kzalloc_obj(*block);
> > +     if (!block)
> > +             return -ENOMEM;
> > +
> > +     block->ser =3D ser;
> > +     list_add_tail(&block->list, &sh->blocks);
> > +     sh->nblocks++;
> > +
> > +     return 0;
> > +}
> > +
> > +static int luo_session_create_ser_block(struct luo_session_header *sh)
> > +{
> > +     struct luo_session_block *last =3D NULL;
> > +     struct luo_session_header_ser *ser;
> > +     int err;
> > +
> > +     ser =3D kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT);
> > +     if (IS_ERR(ser))
> > +             return PTR_ERR(ser);
> > +
> > +     if (!list_empty(&sh->blocks))
> > +             last =3D list_last_entry(&sh->blocks, struct luo_session_=
block, list);
> > +
> > +     err =3D luo_session_add_block(sh, ser);
> > +     if (err)
> > +             goto err_unpreserve;
> > +
> > +     if (last)
> > +             last->ser->next =3D virt_to_phys(ser);
> > +
> > +     return 0;
> > +
> > +err_unpreserve:
> > +     kho_unpreserve_free(ser);
> > +     return err;
> > +}
> > +
> > +static void luo_session_destroy_ser_blocks(struct luo_session_header *=
sh,
> > +                                        bool unpreserve)
> > +{
> > +     struct luo_session_block *block, *tmp;
> > +
> > +     list_for_each_entry_safe(block, tmp, &sh->blocks, list) {
> > +             if (block->ser) {
> > +                     if (unpreserve)
> > +                             kho_unpreserve_free(block->ser);
> > +                     else
> > +                             kho_restore_free(block->ser);
> > +             }
> > +             list_del(&block->list);
> > +             kfree(block);
> > +             sh->nblocks--;
> > +     }
> > +}
> > +
> >   static int luo_session_insert(struct luo_session_header *sh,
> >                             struct luo_session *session)
> >   {
> > @@ -147,15 +222,6 @@ static int luo_session_insert(struct luo_session_h=
eader *sh,
> >
> >       guard(rwsem_write)(&sh->rwsem);
> >
> > -     /*
> > -      * For outgoing we should make sure there is room in serializatio=
n array
> > -      * for new session.
> > -      */
> > -     if (sh =3D=3D &luo_session_global.outgoing) {
> > -             if (sh->count =3D=3D LUO_SESSION_MAX)
> > -                     return -ENOMEM;
> > -     }
> > -
> >       /*
> >        * For small number of sessions this loop won't hurt performance
> >        * but if we ever start using a lot of sessions, this might
> > @@ -166,6 +232,20 @@ static int luo_session_insert(struct luo_session_h=
eader *sh,
> >               if (!strncmp(it->name, session->name, sizeof(it->name)))
> >                       return -EEXIST;
> >       }
> > +
> > +     /*
> > +      * For outgoing we should make sure there is room in serializatio=
n array
> > +      * for new session. If not, allocate a new block.
> > +      */
> > +     if (sh =3D=3D &luo_session_global.outgoing) {
> > +             if (sh->count =3D=3D sh->nblocks * LUO_SESSION_BLOCK_MAX)=
 {
>
> I am not sure if "LUO_SESSION_BLOCK_MAX 10000" has special meaning or not=
.

LUO_SESSION_BLOCK_MAX is calculated based on the number of times
"struct luo_session_ser)" fits into a page-aligned block minus the
luo_session_header_ser. It is not power-of-two, so there is no pretty
way to change this to avoid multiplcation.

>
> If not, we can use the following:
>
> #define LUO_SESSION_BLOCK_SHIFT 13
> #define LUO_SESSION_BLOCK_MAX   (1UL << LUO_SESSION_BLOCK_SHIFT) // 8192
> #define LUO_SESSION_BLOCK_MASK  (LUO_SESSION_BLOCK_MAX - 1)      // 0x1FF=
F
>
> if (!(sh->count & LUO_SESSION_BLOCK_MASK) && sh->count > 0) {
> ...
> }
>
> Zhu Yanjun
>
> > +                     int err =3D luo_session_create_ser_block(sh);
> > +
> > +                     if (err)
> > +                             return err;
> > +             }
> > +     }
> > +
> >       list_add_tail(&session->list, &sh->list);
> >       sh->count++;
> >
> > @@ -444,9 +524,12 @@ int __init luo_session_setup_outgoing(void *fdt_ou=
t)
> >       u64 header_ser_pa;
> >       int err;
> >
> > -     header_ser =3D kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT=
);
> > -     if (IS_ERR(header_ser))
> > -             return PTR_ERR(header_ser);
> > +     err =3D luo_session_create_ser_block(&luo_session_global.outgoing=
);
> > +     if (err)
> > +             return err;
> > +
> > +     header_ser =3D list_first_entry(&luo_session_global.outgoing.bloc=
ks,
> > +                                   struct luo_session_block, list)->se=
r;
> >       header_ser_pa =3D virt_to_phys(header_ser);
> >
> >       err =3D fdt_begin_node(fdt_out, LUO_FDT_SESSION_NODE_NAME);
> > @@ -459,19 +542,18 @@ int __init luo_session_setup_outgoing(void *fdt_o=
ut)
> >       if (err)
> >               goto err_unpreserve;
> >
> > -     luo_session_global.outgoing.header_ser =3D header_ser;
> > -     luo_session_global.outgoing.ser =3D (void *)(header_ser + 1);
> >       luo_session_global.outgoing.active =3D true;
> >
> >       return 0;
> >
> >   err_unpreserve:
> > -     kho_unpreserve_free(header_ser);
> > +     luo_session_destroy_ser_blocks(&luo_session_global.outgoing, true=
);
> >       return err;
> >   }
> >
> >   int __init luo_session_setup_incoming(void *fdt_in)
> >   {
> > +     struct luo_session_header *sh =3D &luo_session_global.incoming;
> >       struct luo_session_header_ser *header_ser;
> >       int err, header_size, offset;
> >       u64 header_ser_pa;
> > @@ -501,11 +583,14 @@ int __init luo_session_setup_incoming(void *fdt_i=
n)
> >       }
> >
> >       header_ser_pa =3D get_unaligned((u64 *)ptr);
> > -     header_ser =3D phys_to_virt(header_ser_pa);
> > -
> > -     luo_session_global.incoming.header_ser =3D header_ser;
> > -     luo_session_global.incoming.ser =3D (void *)(header_ser + 1);
> > -     luo_session_global.incoming.active =3D true;
> > +     while (header_ser_pa) {
> > +             header_ser =3D phys_to_virt(header_ser_pa);
> > +             err =3D luo_session_add_block(sh, header_ser);
> > +             if (err)
> > +                     return err;
> > +             header_ser_pa =3D header_ser->next;
> > +     }
> > +     sh->active =3D true;
> >
> >       return 0;
> >   }
> > @@ -513,6 +598,7 @@ int __init luo_session_setup_incoming(void *fdt_in)
> >   int luo_session_deserialize(void)
> >   {
> >       struct luo_session_header *sh =3D &luo_session_global.incoming;
> > +     struct luo_session_block *block;
> >       static bool is_deserialized;
> >       static int err;
> >
> > @@ -539,40 +625,49 @@ int luo_session_deserialize(void)
> >        * userspace to detect the failure and trigger a reboot, which wi=
ll
> >        * reliably reset devices and reclaim memory.
> >        */
> > -     for (int i =3D 0; i < sh->header_ser->count; i++) {
> > -             struct luo_session *session;
> > -
> > -             session =3D luo_session_alloc(sh->ser[i].name);
> > -             if (IS_ERR(session)) {
> > -                     pr_warn("Failed to allocate session [%.*s] during=
 deserialization %pe\n",
> > -                             (int)sizeof(sh->ser[i].name),
> > -                             sh->ser[i].name, session);
> > -                     err =3D PTR_ERR(session);
> > -                     return err;
> > -             }
> > +     list_for_each_entry(block, &sh->blocks, list) {
> > +             struct luo_session_ser *ser =3D (void *)(block->ser + 1);
> >
> > -             err =3D luo_session_insert(sh, session);
> > -             if (err) {
> > -                     pr_warn("Failed to insert session [%s] %pe\n",
> > -                             session->name, ERR_PTR(err));
> > -                     luo_session_free(session);
> > +             if (block->ser->count > LUO_SESSION_BLOCK_MAX) {
> > +                     pr_warn("Session block contains too many entries:=
 %llu\n",
> > +                             block->ser->count);
> > +                     err =3D -EINVAL;
> >                       return err;
> >               }
> >
> > -             scoped_guard(mutex, &session->mutex) {
> > -                     err =3D luo_file_deserialize(&session->file_set,
> > -                                                &sh->ser[i].file_set_s=
er);
> > -             }
> > -             if (err) {
> > -                     pr_warn("Failed to deserialize files for session =
[%s] %pe\n",
> > -                             session->name, ERR_PTR(err));
> > -                     return err;
> > +             for (int i =3D 0; i < block->ser->count; i++) {
> > +                     struct luo_session *session;
> > +
> > +                     session =3D luo_session_alloc(ser[i].name);
> > +                     if (IS_ERR(session)) {
> > +                             pr_warn("Failed to allocate session [%.*s=
] during deserialization %pe\n",
> > +                                     (int)sizeof(ser[i].name),
> > +                                     ser[i].name, session);
> > +                             err =3D PTR_ERR(session);
> > +                             return err;
> > +                     }
> > +
> > +                     err =3D luo_session_insert(sh, session);
> > +                     if (err) {
> > +                             pr_warn("Failed to insert session [%s] %p=
e\n",
> > +                                     session->name, ERR_PTR(err));
> > +                             luo_session_free(session);
> > +                             return err;
> > +                     }
> > +
> > +                     scoped_guard(mutex, &session->mutex) {
> > +                             err =3D luo_file_deserialize(&session->fi=
le_set,
> > +                                                        &ser[i].file_s=
et_ser);
> > +                     }
> > +                     if (err) {
> > +                             pr_warn("Failed to deserialize files for =
session [%s] %pe\n",
> > +                                     session->name, ERR_PTR(err));
> > +                             return err;
> > +                     }
> >               }
> >       }
> >
> > -     kho_restore_free(sh->header_ser);
> > -     sh->header_ser =3D NULL;
> > -     sh->ser =3D NULL;
> > +     luo_session_destroy_ser_blocks(sh, false);
> >
> >       return 0;
> >   }
> > @@ -580,31 +675,51 @@ int luo_session_deserialize(void)
> >   int luo_session_serialize(void)
> >   {
> >       struct luo_session_header *sh =3D &luo_session_global.outgoing;
> > +     struct luo_session_block *block;
> >       struct luo_session *session;
> > +     struct luo_session_ser *ser;
> >       int i =3D 0;
> >       int err;
> >
> >       guard(rwsem_write)(&sh->rwsem);
> > +
> > +     if (list_empty(&sh->blocks))
> > +             return 0;
> > +
> > +     block =3D list_first_entry(&sh->blocks, struct luo_session_block,=
 list);
> > +     ser =3D (void *)(block->ser + 1);
> > +
> >       list_for_each_entry(session, &sh->list, list) {
> > -             err =3D luo_session_freeze_one(session, &sh->ser[i]);
> > +             if (i =3D=3D LUO_SESSION_BLOCK_MAX) {
> > +                     block->ser->count =3D i;
> > +                     block =3D list_next_entry(block, list);
> > +                     ser =3D (void *)(block->ser + 1);
> > +                     i =3D 0;
> > +             }
> > +
> > +             err =3D luo_session_freeze_one(session, &ser[i]);
> >               if (err)
> >                       goto err_undo;
> >
> > -             strscpy(sh->ser[i].name, session->name,
> > -                     sizeof(sh->ser[i].name));
> > +             strscpy(ser[i].name, session->name,
> > +                     sizeof(ser[i].name));
> >               i++;
> >       }
> > -     sh->header_ser->count =3D sh->count;
> > +     block->ser->count =3D i;
> >
> >       return 0;
> >
> >   err_undo:
> >       list_for_each_entry_continue_reverse(session, &sh->list, list) {
> >               i--;
> > -             luo_session_unfreeze_one(session, &sh->ser[i]);
> > -             memset(sh->ser[i].name, 0, sizeof(sh->ser[i].name));
> > +             if (i < 0) {
> > +                     block =3D list_prev_entry(block, list);
> > +                     ser =3D (void *)(block->ser + 1);
> > +                     i =3D LUO_SESSION_BLOCK_MAX - 1;
> > +             }
> > +             luo_session_unfreeze_one(session, &ser[i]);
> > +             memset(ser[i].name, 0, sizeof(ser[i].name));
> >       }
> >
> >       return err;
> >   }
> > -
>
>
