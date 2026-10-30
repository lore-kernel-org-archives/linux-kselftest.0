Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793400247;
	b=oY4UKDEUJqFV1eIaaaKUVCGv0Qrg2Jc3PoX9NhBW6s6sNZZklxqLtQ8AoxxtUgY+uxOQ
	 s1/c/Nf0rBfyiijcxcp+bxoPX2rbkVkFSZzDJnPMSWxsl3YJMv4kMQRrlgq4JHp/K6S6I
	 PFfPyzi0oybV1KFrOCtrGtwAw376wDx3xdZkX4IQo1alOFCubPNw01KAYOWeh4O+I98xR
	 wNdQvzp+byID117Uz9/ArUkqmlf7CfKfZ05UJ+muF1Gwe6MjEKpQoJZcKEOgjNsvsBQkW
	 LBD44Wx9Cb8oYfn31o4wA1o8bXGUKrROSHN7gBOlUmRP8Q+iBNqXdwHj4vvZAdZ69UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+vnvo88Pr3dQY7eSVbimo7vIzM+xuPPq1OrMINl+rL8=;
	b=jFHmsYuMYxGmqxuT2IysXlyWnle6+km5Isl8LzGKVrgen2NYA+ashzqorHoTJVDlC/FU
	 9wnwpUXe7OqlaetHjmkIEqjYtTemGkwZz2fPri2iXR5EVSWT3Sv3tmB3b5uLhiiPWznh8
	 813mJuIiXP90sINi99K6w4z6Je7a28RT117yKHmfH6hHdz1fKSpkzX4X6VwrRj5bDKalF
	 LJv3y+3u87AijYndZHLqBjcpy54QSfmzWwWGa/5mtEc+zs3pLLo89//zVkWI2vvzW6kkm
	 vQETVq2G+iVReMA5kpw4m1XLQDSWroxp5P+rypJc9cgx/px7qyleIhtz0v+DwKyGudg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DaiZLmwQ;
	arc=fail smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D936606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 22:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D936606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DaiZLmwQ
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so10964081fa.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 15:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793400245; cv=none;
        d=google.com; s=arc-20260327;
        b=R9W6dJ5D2qBHknEpDpBmOxGaT781tMmUqSUp7dM7rzvTEY0m+OgXphlq4scSdOXeoG
         8V4dMh1CZUN5/jLvAd305w2HjKkyD4s1Mh65oJ3fHy5Pt49Pg7HlaHyVwcsL15XJtmkX
         yFO4c1a4veYnhpO1hOIUtYumshnK/1bj1zwNpQ0U1v09PBVpmRY4/FIGyMYJOmgaHn85
         xzKMLESdrzrXj7nUKqp1SROazAAOaPxtBcH8im7+RNPgCJkUYRzPlOxMtl8mTLG6Lb22
         kKj8kJy95tKLFl2zshk7wpQlBAAP4IUxTP6pogOwBBf0nnz78IvHxMo0579GGZSZbvvn
         AO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vnvo88Pr3dQY7eSVbimo7vIzM+xuPPq1OrMINl+rL8=;
        fh=WJfZxHuSxKUw5xXH/cpSdwqSzDHHs5614Ughu0fmMLg=;
        b=HZK4agkl8yHcav0zVZaJMmsldRrk0yADc1SfeOR63DMEr3sPbmlT0xIxTwwMNQQEqv
         1P1QuONQE+1sJ2fAXqgmni5bJm5Ds5kdM2PJIEIzMgkKdXLlAFeR7sBAyggNZcfGV9P3
         VdP64dR7HOic1F+W0jo1kSCs3wW0joiVjlODaYsV/MMJnwsZFN+L+Z1rPgZcu9GcLsBL
         JjsqUPiAIvvqmBp5fMNvNpAGWMiVGOnADkRSGnRy3otyJ6PTpZ/fil3ea1fTsArJbHoa
         0MRQcNtpW0cXTDrIFggBesFda/V88EvWHR0YTUO2yEwW6R6ugtf8T5e0F5DVe1l9w60p
         kY3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793400245; x=1794005045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+vnvo88Pr3dQY7eSVbimo7vIzM+xuPPq1OrMINl+rL8=;
        b=DaiZLmwQeVKbbcdVOyDCZyZxvLmchXpkwa6kU1MTGUpPaTuPAdDfGq0V4QSy0+e7bX
         b0djsAS8FyOOR3W52Qg6YzAzerrLCBVpq7nY+MxSj0j5lIi2ungzeDifs29L4IGMfolk
         vUkRosIQQ1t+JOdfgYq5iXS7fw9pjV7FBSmpiC1Zgex2wat6xMyz7LwVHydh7FZQ18Pk
         V5U1+RQU9/KzyxvYcSFLDB4cWd1lv+HjWcchRSFrFwNd+9add2cR5WSZFMgBjt05oqSY
         uuu1CuFi3rF5jSHSUWu5guBupRZ5HM+kS6UfQLzvmZ0E/CaNK/UbRTu0rtCd1L2LT4O6
         nvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400245; x=1794005045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vnvo88Pr3dQY7eSVbimo7vIzM+xuPPq1OrMINl+rL8=;
        b=h475U5FoHvTEoENQYT2dqVZlZdX9VykNiNsxjMwGRBQkreL3CWB+prV3FC1xQ+zF8l
         FT/dXZ/TlwDMldQjCxmwW9RmRaPsluZtbbzfq5Hnt3KO5Lj8KibzSEk+ZWtLk5lX3eW7
         hEBufwrpMqzo6kN5kmmaAy/kq3TJ28XqSoH3cPkR9u0Hxhk+1mtIw8tx7Rns3jWksloG
         Sbkx6j3DWrYRclBBlVVmGV6FCi+kknSOyqztbicmcsNSM/7ixy87t01WOK8/7AxE0Rdc
         +p/hk1lMqcjnviSTo6cJrAuipIzibeqSGly6AG3Tq3KghLXxX3YIv6ZGztsFV5wkENFG
         aB1Q==
X-Forwarded-Encrypted: i=1; AKwUvByROLbo9qr2dUc8fDkGaIgCbicNPVFgHYW6WBIKtBvcfrZ5V3yRBS0bgMzy1vZOasvLJPnfecznTKumtFkaTqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxY5CyYONBFUmDHJiuvKCn1e4MRsDZfs35Ne5f7ChesaogHg81
	UMb/Tl9aFGExkse4zXujTfxMJkqQ2vMzVxJ9WQRicQ/LeaOcMucKOjTZS0tN0sc9t7a1KIRloAw
	/J98+YlveyTyp0A+iFyzujgcE9eY7xyOUkNXUnsX+
X-Gm-Gg: AYBFou2A/fTVIGCt31bHNl3UigH0FInALBD+UDLMPl9KmMREOBQGUTAWS0f0hEj6RvH
	7SfIs1kBWWG1H26Jfozi7ARNYC8Uw938y6qr2neaFRtyInMjwm8Av0rR/7zjjpPzRSUaTy8TFM8
	EkUur8G/sEiQf0nh+f491zkzl9tQl1xtOWy6d0ViyfW17nusXrvPcQLxnoMeGtLKbK/9lLw8iBM
	iJjUcz29DoLpveIP3XXkvYcfgLxtLbMr1Vr4S7yD+IixmdlaTQTpvgCcaN6rAI4YCJOw+tLRXwH
	dEAKHuVKNEqwtnwihzlF57jgM9Z1N/rMmvBcH3+GKEDO6tOgWcSlbALoerwaZjdvfFPR01ehQog
	1oJt2n0uVmHChYcfM2Ujh1YWDz3FyLH/3IA==
X-Received: by 2002:a05:6512:a94:b0:5bf:b246:87a2 with SMTP id
 2adb3069b0e04-5bfd957b610mr1268679e87.10.1793400245078; Fri, 30 Oct 2026
 15:44:05 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026220546.3114241-1-skhawaja@google.com> <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
 <20261030121113.GB3889730@ziepe.ca> <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>
 <auTR9SnDLsLVmnJ7@google.com>
In-Reply-To: <auTR9SnDLsLVmnJ7@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 30 Oct 2026 15:43:53 -0700
X-Gm-Features: AclHuK84pmgR6t7GwgKZ09yPCaz9JinHcZg2AVlK1zJKyqi05vBjmcmKbMe2QqI
Message-ID: <CALCETrV5eqg6d9=+BQhCpRwBNe3aCQiut8vxPBs8b7PToqjaHg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
To: Samiullah Khawaja <skhawaja@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:40=E2=80=AFAM Samiullah Khawaja <skhawaja@google=
.com> wrote:
>
> On Fri, Oct 30, 2026 at 03:39:40PM +0100, David Hildenbrand (Arm) wrote:
> >On 10/30/26 13:11, Jason Gunthorpe wrote:
> >> On Fri, Oct 30, 2026 at 11:20:30AM +0100, David Hildenbrand (Arm) wrot=
e:
> >>> On 10/26/26 23:05, Samiullah Khawaja wrote:
> >>>> This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prev=
ents
> >>>> holes from being punched into a shmem or hugetlbfs memfd while leavi=
ng
> >>>> the file fully writable.
> >>>>
> >>>> Background
> >>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>
> >>>> Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
> >>>> memfd_pin_folios() to pin the folios backing a memfd and hand them t=
o a
> >>>> device for DMA. Pinning keeps those folios allocated, but it does no=
t
> >>>> keep them in the file. If userspace later calls
> >>>> fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range=
,
> >>>> the folios are dropped from the page cache while the device continue=
s
> >>>> to use them. The pin holder is never notified, and from that point o=
n
> >>>> the device and the file silently diverge.
> >>>
> >>> We have the exact same situation when userspace maps anonymous folios=
 into vfio
> >>> and then desides to MADV_DONTNEED the pages. Or any other memory back=
end that is
> >>> used for such purposes.
> >>>
> >>> User space must not zap/punch things that might be pinned elsewhere.
> >>>
> >>> That's not specific to memfd, udmabuf, iommufd or anything else.
> >>>
> >>> I don't see a reason to make userspace (that should not shoot itself =
into the
> >>> foot) a kernel feature it must activate itself to not shoot itself in=
to the foot.
>
> Agreed, for normal use this is userspace's problem. The seal was meant
> for the kernel to cheaply verify at preserve time that nothing was
> punched.
>
> >>
> >> The issue is live update doesn't preserve those background punched
> >> folios and now we have created an UAF attack on the kernel across
> >> kexec if you don't do something about it.
> >>
> >> There was some notion here that with the right sealing flags we could
> >> tell if everything was 'live update compatible' and then know that
> >> these attacks are impossible.
> >Just remember that there was any hole punch and refuse to live update th=
is instance.
> >
> >We could likely implement "we saw hole punch on a pinned folio" as well,=
 but I
> >don't think that's required initially.
>
> If I understand correctly, you mean recording on the memfd that a hole
> punch happened, and refusing the live update if it did? That would work
> and is much cheaper than what we do today, where iommufd walks all the
> mapped pages at preserve time. For truncate, the existing F_SEAL_SHRINK
> is enough or I can record that also on the memfd. I will send patches
> for this.

This entire situation continues to give me the willies.  After much
prodding and contemplating (in my own brain), I got a friendly LLM to
report:

--- begin AI output ---

IOMMU_IOAS_MAP_FILE uses memfd_pin_folios(). Collapse [MADV_COLLAPSE
or khugepaged] checks the old folio=E2=80=99s reference count, so a pin
acquired before that check makes collapse fail.

  The problematic interleaving is:

  1. collapse_file() locks and unmaps the old folio, then passes its
reference-count check (mm/khugepaged.c:2446).
  2. memfd_pin_folios() (mm/gup.c:3483) obtains the old folio from the
file=E2=80=99s XArray and pins it, without taking the folio lock.
  3. Collapse copies the contents and replaces the old cache entries
with the new huge folio. It does not repeat the reference check or
freeze the old count.
  4. IOAS retains the old physical pages; accesses through the file
use the new folio.

--- end AI output ---

Is this correct?  I haven't personally verified it.  But this whole
pinning-folios-doesn't-keep-them-in-the-mapping situation seems
*extremely* fragile.

--Andy

>
> >
> >No need for more shaky seals.
> >
> >--
> >Cheers,
> >
> >David
>
> Thanks for the feedback,
> Sami
>


--=20
Andy Lutomirski
AMA Capital Management, LLC
