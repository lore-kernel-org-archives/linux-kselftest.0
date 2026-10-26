Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793054813;
	b=MK/8BnNJCLyKvyxMN8glOA6O18Uao/fLSdogXW+lWyF+4ZTfqQ7f4yZrIeGhjljXX/mU
	 hQhsZKyOdANjusA3tqVYoSntJRXQ2X2mPxJFiXveK1vcloVqIQzO8AsnQNia9xOK8wxlo
	 f/14m5wDRXUjxge3m4fMzUCEvn+FmAaMMXXy26wuDnsKrXvqNyTjjaPTtv46C2fYltB06
	 kA+RukI0KCMihbUZrDqMbe7ZNYhRzl9/4skpXocZYCEq+7bIgEna9k80Cm4OyXDkpNKyL
	 ebkaTkdGJwgI3qO4fHrDSLqS1cUizEwzTxg6G38f7jQ9fBjuJUgKX3VMj9ZASwic+cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sKnr+HaOzY7Irrp2H9F7r4w2uph5h2kmhEeFaXwyEMA=;
	b=18GcYEve1F8u40RzNTT8nIgEwnxsW71olLAfaxZEBnPJDQIay2c7+0NP/zHMLJuFgnGg
	 ZY/UuqSKwZdIawWB+lbsqStYf4KC7FtneUuvEWeUy3ahrDPSh7Td2EN3ZOcAdHO6WOB9W
	 HOXFIfmGML/03S4uGRi6UJ+o0XyBYuzNf2E6wnUjEu3hyubtlZvNNmmnhavZhwZBnEThp
	 fmNX7PLbaHNQP6/NqwyuDND/uicnzBJExZKtBOE8a25gKBZNsNuTPFX0bQ+2X9Kic218v
	 EJe/Lq83NkhmizwVQRNTCxllQAfqDD8l3nIMUmWNFYx2omb162prSMPhRfRuvRYe9yA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IOFsVvG3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D66606A323
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 22:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D66606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IOFsVvG3
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so3019631e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793054806; cv=none;
        d=google.com; s=arc-20260327;
        b=l//I9IAcsuMMrq18eIeTYNq4gVloNDDdaEmo/D1WPUsGcbXCSS8bi30k4PlswNSe4H
         7oW3fb56ZCtE6VGRBllVZ4P/TJLqsn+MiwHEtGxjtgM8YTFYr1MQZASqGISA4xGf3TB2
         hJganLmftY758BpnNhe4XPv+Z5AU/NXWRFsihBnVBIlA3YEgegvcqfTPH2oHque7OuUc
         ypR7uzjjnPrQMcOvXF85jcAi/16wq0ruAIzDgyKifBCCbz/FfBYbJR87K4xUEFTdBePF
         dMMCuJ0xzG0cHI5gnLQ0DJALyX711oqEgSbCR2201LUwO7GAc/O8BkAoOHDNW3ZjV6Tz
         8bxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKnr+HaOzY7Irrp2H9F7r4w2uph5h2kmhEeFaXwyEMA=;
        fh=8u4G9L4hBnQ7ZDBrbkKM3dOeGuR002du6jguO30+kAU=;
        b=siW2GBZkawhYJ7OeXEbFs5tXrbe2Lxqrsp/drKFQJbcrz9+NqWWTHGipuavUi6P1qk
         6XdvKXaajCv9TAXE3iwkUqW1CwgS7paB8f0hJfN1Cb213Zkj7OsJ+le5onPfU9SaA98n
         QzMX5PBoFomH0/zYSAMS3aKstVFk2ZtufWb09oyRBnA2UmR3rb0b8eRf0mQL6mWs1btm
         vAHTA0Fw9YKvUltxb3LjvD7agBaiRROgf4N+OshvZNTRwSLPkt+fbloEPZAnox7zHrql
         b91LfWCAQSYJGipRG8+AMtAqGzB9JmmUJTLUrEh4tDuK1va0S81fiNLgZuHzMNRnJadr
         ueDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1793054806; x=1793659606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sKnr+HaOzY7Irrp2H9F7r4w2uph5h2kmhEeFaXwyEMA=;
        b=IOFsVvG3NSAD3HQiNhWpL3xOBWeFRtR3M7DeFYRGlG9024CAVL0BclZq+S6ghRSIWE
         E0Kt3NMTpMvEFh9m8yx+vpnYuCtqzZQ28yrkGkOHmwbJ+OS/FnBciKMvh34M+kcoCCOl
         Z2Ecmb6YILV0KENHnULJ6ha+jfnuhTE9OmQOtmZ4JYXTLGs8Ff0itsup6BKnrxJgen/W
         L8r30Qn2tTTSYPH+0TiIunxBTdq1zvhjrLsS3Hp9Fc6rUz+0kj+oXRMP1K7i4huM3ZrC
         CXMi12Rhds0KfLfi2+y10IxrDw+vVJgAyThh0UFHJXCkL+0SIlxgIVMgZv1LIlbPYKCO
         87Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054806; x=1793659606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKnr+HaOzY7Irrp2H9F7r4w2uph5h2kmhEeFaXwyEMA=;
        b=JLZ71/brJUBNWQva+Opfb4l3OVPnf9MUZkVPa2VrMGEINWzlM7Lfd8/Lfwe5Nvu8bK
         TmjD537Wug4LFBuUkOVu+x1ROcxK79LMA/9U6GIWh1yc72QSHiDBoVPp/32000E7bMYI
         Ms7HTr0L/dvW4alM0sGpTwF2nJlDlxErNZpRolx3KHh9Ma+ALQZi0KEW77t869It70/o
         nxy9JzbDYdkzvCNoRNxHG2c6lcYvNvx6kIyUqfULXdvjLpsa5ap+bX9U7FeVMDj3Q66k
         B6LNP+HSuxj4XDa08+1Vq1iPsRi+o4Yc7Nm6WNPxA3xQ+N90EE77HcOZWZw8unZiUV7M
         uBJA==
X-Forwarded-Encrypted: i=1; AKwUvBz+aysp9OOAaq3kddhObt7/vUBLQh4ZOkHKj9N3Ofdj3GqxCz3Jf6Ac7MAB8nCian5IQ6SEPXOSAlfczDq002Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ2v+3zg+MPZoEqH42OShii/TY/tOpXefEN+msiFc+6fWkcYO+
	/VT8klnGsI31NbOcD0UC3Fig3FeXuhINK+LeYLOL1ib4jTwjM67NeUrUh1t8XdK4VzcclpLoqfK
	kvx9N5gJO+zvldf1Mgtfk571LW86gO9VYui5w9P0g
X-Gm-Gg: AYBFou1AUmO+g2pfs75uhbnH/ilLMLAQF0qWX9DV6WmhrV/fhBNZdtdDPzUalnNasks
	bCJ22Q8DFNc3PlKJZ1rovi4COfI3GAS3qlcWhivpcUrEAUkFQgsFQ6M+HVkWeolbvK+L841JtJW
	tEjrYweub5e+jVB1xTZ5forGvXceaGXr80Lf3XNhWB8Ump9I//JBMv11vmxqVysOeck12pdyUqk
	iJ8Z+2+Xl9Qn34Waz+i/zGRjGllonxDIqIL+SJebhdDVDV2ediZihPJ10vnHxObE3QVP6hX2pHN
	mnc0kZqRXfNSCg/ZSDgOC/6+muLxuTF4XU0vVfb0W2ll4Joh4eqXewZM6VBTVsXrke8lO82/ysi
	MI61oK4gODSzhuX6L7LP9ePCuml42UmgS9A==
X-Received: by 2002:a05:6512:3e0d:b0:5bc:e28c:1349 with SMTP id
 2adb3069b0e04-5bfb71fd555mr2854881e87.56.1793054806319; Mon, 26 Oct 2026
 15:46:46 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026220546.3114241-1-skhawaja@google.com>
In-Reply-To: <20261026220546.3114241-1-skhawaja@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 26 Oct 2026 15:46:34 -0700
X-Gm-Features: AclHuK_ddIvC0f7JBYWchwOFfRRqT-a0AZ_RsWY_MxD_DGe6_YpRsBjkP2gzVDw
Message-ID: <CALCETrXNEWQNPjtuHnTfVFOafeJ7APXq288Cq16Q5adDNYx9+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:06=E2=80=AFPM Samiullah Khawaja <skhawaja@google.=
com> wrote:
>
> This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prevents
> holes from being punched into a shmem or hugetlbfs memfd while leaving
> the file fully writable.
>
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
> memfd_pin_folios() to pin the folios backing a memfd and hand them to a
> device for DMA. Pinning keeps those folios allocated, but it does not
> keep them in the file. If userspace later calls
> fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range,
> the folios are dropped from the page cache while the device continues
> to use them. The pin holder is never notified, and from that point on
> the device and the file silently diverge.
>
> The existing seals only partially address this. F_SEAL_SHRINK prevents
> pages from being dropped by truncation, which is why udmabuf requires
> it. Hole punching, however, is only blocked by F_SEAL_WRITE and
> F_SEAL_FUTURE_WRITE, and both of those also forbid writes. That makes
> them unusable for memory that must stay writable, such as guest RAM or
> DMA buffers, and udmabuf explicitly rejects memfds that carry them.
>
> Proposal
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> F_SEAL_PUNCH_HOLE fills this gap. Once it is set,
> fallocate(FALLOC_FL_PUNCH_HOLE) and madvise(MADV_REMOVE) fail with
> -EPERM, while reads, writes and resizing are unaffected. Combined with
> F_SEAL_SHRINK, it guarantees that userspace cannot remove pages from
> the memfd while the memfd remains writable.

How does this solve the problem?  F_SEAL is about a userspace
contract, and if there are existing users of the APIs in question, it
makes very little sense to start making those users fail because they
haven't taken the appropriate seal.

Would it make more sense for the drivers in question to set some flag
(refcount?) on the file to block hole punching?  Or perhaps to have
the hole punch code notice that it's trying to punch out a folio that
is pinned or otherwise referenced and to refuse to do it?

To some extent, the issue you're describing is maybe broader than just
the APIs you're contemplating.  If I open a file and then do something
in thread A that GUP's the file and punch a hole in the file in thread
B, I'm doing something weird, and I can imagine plenty of ways it
could go wrong.  (Especially if it's GUP for write.  I hope we already
get that case right.)

--=20
Andy Lutomirski
AMA Capital Management, LLC
