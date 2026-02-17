Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028EE37418F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356474; cv=pass; b=Z8qEEkQdTdrMx/GP4BgMepM8soaQutLtu3ix01FJG7lBn4en8/SrQ4JN1KyljckngHsiq84kmJ34B9K0xdp1m/RvsY2gxq03WOISYEZcpgNwfbh0FasYMDxUBDOYSlQoUiSVJsJ62bBs8fJD66OUgtfhJZIpwDVEvMGe3Ds2nqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356474; c=relaxed/simple;
	bh=2AkZD/xZt0VUvR9sJ0sGJHU4a65qrHn4YVu35A++2Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHWcpbKTIRwcp/UMQBBFIbpK5E+ffFwZzbBOAGvnv5+nXdPxl+LVS6vyyoyD8eOaKnoMiD2QvCe24LIoFI1Ima0eT+gqB93tQqcpdcJgCVY+mWj5e2AQYlVXXV9J+pioWzvJiJKsUu7dITTAq3v3nPeZrjk/tPSuonDwyuZMWjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HvnoZR8z; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HvnoZR8z"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so10405e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 11:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771356471; cv=none;
        d=google.com; s=arc-20240605;
        b=Cu/GUrv0BTSE2+WLkmUS6+VXGFFguKIxqKavTnJvPktTk1g+sHEnqoNOfN5e9RY338
         epheBrGQLhiZ4vmZT1IsTP094avrI+3d/o8vUvtaBzS6S/bG6tfrrKpQ4ePyoTQPlaEa
         u23tsPdORXBDetqAyIIM40tRzuY5+Za/NDLAVJn5u/yt5IpC6m18z8QXZevm89Tak9rS
         VrPVvDVuEe0s+j6PmtWMOB1ez2376MOHNd/ZMPpS4uS6zWDGXD1+BkJQaF1alHTfOE8t
         +wF5Le9QRW3jgNasJnJhEogaoklFGLoi0l6yQ5o0MSSFPPRaIejacCo/aWllk62gtszc
         4aHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SbtQMFsGPA/6ldfqUOLBsftSiaWAN1XegIGnQQjLLP8=;
        fh=KiTa5Yoj7GnjwKiJHQUobTmUrcF0kCRaJ3hbJanzag0=;
        b=WZxz2llFQ2hbPf3A4fftYv8XP2vFTwTlOCXjuztUkGIV2YvES8gyoMWfAXbVsc6T2v
         u1OPtF3qOMFp4m0ibAAFLSmo+XAZnQpJMHkpThFHJV0J1G8zGr+eoQGQMrHgpkniXHt8
         gvrvS9KftyDOrrKjlFJzVH2UNcwqinOjgbm2GUcjzg05Eq+2J+46rIuwQ6z/k3jIj5Oa
         4jV+uQ5Eg+rAxW49usLPJPAsmgNsr6OWfIVaIyHuwQ1BRUhg7QE2v/sQyOldLLo493ZG
         rgaU65iDM+o6XhtBhho64avf+ByAqGxUnCAiXehGhNKn4I8OlRKhgqh6KSw7no9q9Nna
         B2pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771356471; x=1771961271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbtQMFsGPA/6ldfqUOLBsftSiaWAN1XegIGnQQjLLP8=;
        b=HvnoZR8zfyEtT1CmYYfXEd0xZVj6smvvAGDvaTQENlihM6gnmvZajkehm3vadtH7Hp
         qg0dQLuTPri+dn9JwfsYHYW9Rmbpdxia0Sgny3asuglp0d8zRuMVLdChgN/1W2WPA9Dp
         Ty/akPoO/mprHf0Vl4gr9gxLNSIqCJT+DzOEXRDeKFET1VJ3vJ69iUKfFSCWqIISsK6r
         91m29W4YLDaBcOLbgI3SidxtX2pgsQmtjBuDauuRnNkFSWfTm0VE/KqYWHv3VvWrTt8S
         sUSTRr7pxadlKu/F/e1ud05UJ/o72NKYHWknk9YA53Dm0hhIfwHQPVD1LPS/1AHrY67c
         jJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356471; x=1771961271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbtQMFsGPA/6ldfqUOLBsftSiaWAN1XegIGnQQjLLP8=;
        b=pFSXYmrHES5uskvPVIvdXolKwt2nAg9fPtif3ugLHsKn+VT19t1o/xC+7rNONdgj+0
         1HDOUUJt2CarJ3VmSIUl/86z5ghrmJQLtVXOKxDpg4rMbxJDFcL2wKlBCdF3tmWW72gc
         5PxHqu7ANotcYWjCU1ibXiIB/JDEU/d/DM11eP8FPWLSq9ZmmvdQNaAIuP0fgzxYmC2Z
         ECtv4NRA4vsIeRhMFOI8MZMtf8BE8dLK0030e09KsRF9c+t0myrM6Nmlpv4TW3Kdj0ta
         4S7alucc55cvOCkWwcjwLQNtVKJdQR933LN43XM+sUqQdc6w/J3HFOsfcUOhmSXEqpoW
         zOqw==
X-Forwarded-Encrypted: i=1; AJvYcCVD/vBCzkpdu60/vhQ0DASG9NdLi06V/aq1HuJ9ulSzpZASq505RzQpD87QrCD9xzxRcD5Ji+fXGMQTK8HaZJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFP4H6nxLYmjTIdJrmy/uaJw7u5cYgq1NnHBF8s1MWpJ7N6NOI
	wl1heOh+atq/EYpDl89pN4PVQi1WOFcwAw1ZAx9Bx142MgKPwY40WhuXPAnX6yxA7pv4e6EUb6l
	AZdqWrV0UsRvk7xtIDu2S9srOdnVIwwzq+z3Qee93
X-Gm-Gg: AZuq6aJgyKmo4LP1qYPpRqT2LAJE21i7IGrqEmaOwNsawOk1hc5O2gTTtuQzVqrGzpx
	nVCZoN3tYWsbvq9l4sbbpWXJyxnA6YVCoZlA+A4abacKaeY+pZ4J211RGHnEt9lIpoz/ZdaYIZx
	zIBTwrx9t0sgGefGmfeM8deENSCe/QxcAUiTT+9sjVWvsWlQQYoPJyZ9l33iw3mvx0VPxffO1Uh
	tv9euQgeWTgQV7WXGxGp5x6EguDeZIkPm/r+HkcB1p+ZcK3vEhwNqkezIJn0tUMz7dQQZb/5CHz
	XWS5XLPqKG0hdVPqkJyeKbJMqMTqFOE2OzkzAnzPZdSlUks2RskDALcHw/5tmnOoVwZAAQ==
X-Received: by 2002:a05:600c:6a0f:b0:477:86fd:fb49 with SMTP id
 5b1f17b1804b1-48388809dd1mr1315515e9.10.1771356470995; Tue, 17 Feb 2026
 11:27:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <20260212215814.629709-2-tjmercier@google.com>
 <aZNFTR_gc6j116rw@amir-ThinkPad-T480>
In-Reply-To: <aZNFTR_gc6j116rw@amir-ThinkPad-T480>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 Feb 2026 11:27:38 -0800
X-Gm-Features: AaiRm50lkIkI0vTw0pKWrhRFJ18Z83k0MjgydYcYSeBtbsOtDjpOH99UjI76ZFk
Message-ID: <CABdmKX2DD4iapAGtdjJyb7CAHiS9RaD3pbuAnd=1tvudxfJkKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kernfs: allow passing fsnotify event types
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 8:27=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Thu, Feb 12, 2026 at 01:58:12PM -0800, T.J. Mercier wrote:
> > The kernfs_notify function is hardcoded to only issue FS_MODIFY events
> > since that is the only current use case. Allow for supporting other
> > events by adding a notify_event field to kernfs_elem_attr. The
> > limitation of only one queued event per kernfs_node continues to exist
> > as a consequence of the design of the kernfs_notify_list. The new
> > notify_event field is protected by the same kernfs_notify_lock as the
> > existing notify_next field.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Looks fine
> Feel free to add
> Acked-by: Amir Goldstein <amir73il@gmail.com>

Thanks Amir.

>
> > ---
> >  fs/kernfs/file.c       | 8 ++++++--
> >  include/linux/kernfs.h | 1 +
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
> > index 9adf36e6364b..e978284ff983 100644
> > --- a/fs/kernfs/file.c
> > +++ b/fs/kernfs/file.c
> > @@ -914,6 +914,7 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >       struct kernfs_node *kn;
> >       struct kernfs_super_info *info;
> >       struct kernfs_root *root;
> > +     u32 notify_event;
> >  repeat:
> >       /* pop one off the notify_list */
> >       spin_lock_irq(&kernfs_notify_lock);
> > @@ -924,6 +925,8 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >       }
> >       kernfs_notify_list =3D kn->attr.notify_next;
> >       kn->attr.notify_next =3D NULL;
> > +     notify_event =3D kn->attr.notify_event;
> > +     kn->attr.notify_event =3D 0;
> >       spin_unlock_irq(&kernfs_notify_lock);
> >
> >       root =3D kernfs_root(kn);
> > @@ -954,7 +957,7 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >               if (parent) {
> >                       p_inode =3D ilookup(info->sb, kernfs_ino(parent))=
;
> >                       if (p_inode) {
> > -                             fsnotify(FS_MODIFY | FS_EVENT_ON_CHILD,
> > +                             fsnotify(notify_event | FS_EVENT_ON_CHILD=
,
> >                                        inode, FSNOTIFY_EVENT_INODE,
> >                                        p_inode, &name, inode, 0);
> >                               iput(p_inode);
> > @@ -964,7 +967,7 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >               }
> >
> >               if (!p_inode)
> > -                     fsnotify_inode(inode, FS_MODIFY);
> > +                     fsnotify_inode(inode, notify_event);
> >
> >               iput(inode);
> >       }
> > @@ -1005,6 +1008,7 @@ void kernfs_notify(struct kernfs_node *kn)
> >       if (!kn->attr.notify_next) {
> >               kernfs_get(kn);
> >               kn->attr.notify_next =3D kernfs_notify_list;
> > +             kn->attr.notify_event =3D FS_MODIFY;
> >               kernfs_notify_list =3D kn;
> >               schedule_work(&kernfs_notify_work);
> >       }
> > diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
> > index b5a5f32fdfd1..1762b32c1a8e 100644
> > --- a/include/linux/kernfs.h
> > +++ b/include/linux/kernfs.h
> > @@ -181,6 +181,7 @@ struct kernfs_elem_attr {
> >       struct kernfs_open_node __rcu   *open;
> >       loff_t                  size;
> >       struct kernfs_node      *notify_next;   /* for kernfs_notify() */
> > +     u32                     notify_event;   /* for kernfs_notify() */
> >  };
> >
> >  /*
> > --
> > 2.53.0.273.g2a3d683680-goog
> >
