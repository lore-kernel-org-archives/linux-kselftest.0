Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57053489FC7
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805642; cv=none; b=Y2xLKsEud9i+l+LRWf3M/tyRspZMWGYs++PyX70ocCUtiFYXpdn54tQ8vFv+ScUllvzE46IOlHCVeeJyKWlhbvnLDopV77IFrKtG8lnBdpka2Loyxkn5hNyXHwjSgUiBt7XcwxjF7TY3BX5iHNLaDUJqAIIp+uNr0n4QrxeomAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805642; c=relaxed/simple;
	bh=tTAuW5YXvrWgMERGBm9kuawMACX/4fAn9/TDnPNtVXc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zkc5Vs7ufEzA3baHPfOeIsxo1E6yPlJFduECv3FJ3mwnm6hnI67Zy5nP7xm6F9fC1xKqiZkb3sC0hlyG1Ow6g11Y9X67NqT6zNMV1ucn46n9TXHrzU59MskqQIMqAlyJ9OnfTrtWnVMMCioUB4D/K3P0MMjXxYypURRIVotMVXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hd6rVcEt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DwhPinWH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hd6rVcEt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DwhPinWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791805635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tTAuW5YXvrWgMERGBm9kuawMACX/4fAn9/TDnPNtVXc=;
	b=hd6rVcEtaRUmu5RK8CPCAGYginbIJyeuKbzcYz7iaNqy0LoeIbzTKz+06qcYiupGxhB2Fq
	KjQ3Mva3tYPHG8oTwyr9hqIES2ZUZQJXejdEL2uPRnj2UQEnIXMdqyk0V37WoXXoa//pLx
	E91BEK1Y01L4d88v0miPrS9q7KuyRUQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-6o_Q_26BOaavPEN5SF1QkQ-1; Mon, 12 Oct 2026 11:47:13 +0000
X-MC-Unique: 6o_Q_26BOaavPEN5SF1QkQ-1
X-Mimecast-MFC-AGG-ID: 6o_Q_26BOaavPEN5SF1QkQ_1791805633
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b028d93c5so1274126f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791805632; x=1792410432; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTAuW5YXvrWgMERGBm9kuawMACX/4fAn9/TDnPNtVXc=;
        b=DwhPinWHnjRRDfLT5ckCnhVZT3MPyvPSWXh5sniv2vWCZum9F7r+HebR4oIyqjXbSX
         ll2WI60GCsS8WnlJhzi9j1dT6jmuZP2K24uQd08ajf0Gnjt27psE6Oc6fSLSvFQhcgEu
         ds+BVWhLccTTup362o59/FIQjer7IYcBNZN50dP1OhkNhKdHTG4RJiRmuxdZypftlK1m
         hDYQGOIhQqd0CLtIG53+4CqTFqFZMtlWllHLPdPMqcO+tXq95HP/upXcjW11vto3KsRO
         23LGAOCInT2Du/0rNrYXKlHlIrQ03LX07ovEeYVwhJUdw6zL7iDw3uGNvknuqKKFZlDC
         zONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805632; x=1792410432;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tTAuW5YXvrWgMERGBm9kuawMACX/4fAn9/TDnPNtVXc=;
        b=RNRglNTE/BNbQFC2MZ9YjlSDWdiw1PEpau0UGdD4zfMJCv5NNubxLusjmlUwl7hRFs
         nxn4xnBvh5rMoOS/BImeWiKtgtI/yz1YJqNEG1JjfKWagFTC/uY2Bh0lrPBf5ItXaoxq
         JHA30HRQXqNC9ICzSOWqa5k3uew9YScmwXYrGWxEes6RnDskfib3SKkP3nLdwhXSEf5p
         ZOeeIT75OQdTZjoSKxDXElppXp2uQcg2t54SVgTCPSjtOqdI7OZ37jX+/2Iy8y+sRlHP
         D5rD1axl27iMSb/+BR081O1tLPh3goSw8u0huwf2pBnJgkVdsw6x4mlrty3NgKgjvoiC
         Tsqw==
X-Forwarded-Encrypted: i=1; AKwUvByRnT/nIfrZqjvzq3bI1NqMAIG9t3qXKWpG8rwLB4t08ez61Te0cx3zuJdYOi/4KNvOzetgCmp5com5f0LfP58=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpuBRnbZQvxTCZxO7IgSjOWoFRMgTTDqE+G5Wd2SmxvYzSe/Yg
	1OgU6cXgrEkty4yALarw5GaFagarsnN0D5rkhtRWg81IWSZTNBdSzVNa/TMJOahm2u1H/2gg3YR
	+M3siMGSVzwz0W/s3tG4CTWz5g3IxnFVxfAHUMm5UYl2BKwBSER5I4Oa4VASkoX4x5D3ahg==
X-Gm-Gg: AYBFou2m1ky3/gJospfN7PdUdlrxX8fvUYMGstmz5m06cj5vg2zHYbbV3I1t9HVeAN5
	GGDRpUJ9ZEaB25dmXNNHVuzc3GDYOVmyGkKrvnTRGb6/cLXBWhXD5lNomfvOhhrG0vMHVrWPmO6
	guWC9kEJlobBqeKWyuOLRJx9zDwwPqbTRv6Bw9DDhSC1bVk9cUqWile4lhI9Cha6uvy+w2PULSD
	stw9NHUrmuZi9YUujxmr3pyXy31DXpsPRRiDYY3sKBkbEflnknxSY3HYZl5w7/TB0d7xRJGT7u8
	w1rHY1HgTRSpGlCacPGkR+vQHQZ/WWO+4Ujm7vR4MyVtkMyriPIAnuBxiy7frQHn6wQ8lOeDXDu
	gw+C3EmwAOJaH1ctfKSmQgHDEr7p+
X-Received: by 2002:a05:6000:2f82:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-48dba78459bmr21037791f8f.7.1791805632465;
        Mon, 12 Oct 2026 04:47:12 -0700 (PDT)
X-Received: by 2002:a05:6000:2f82:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-48dba78459bmr21037732f8f.7.1791805632034;
        Mon, 12 Oct 2026 04:47:12 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm18489239f8f.37.2026.10.12.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:47:11 -0700 (PDT)
Message-ID: <4759c9b0dacdf1f9c0cf47158895860dbd0ec401.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] rv: per-edge dwell-time statistics for per-cpu
 monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Mon, 12 Oct 2026 13:47:09 +0200
In-Reply-To: <20260911123439.463052-1-tobias.schaffner@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 14:34 +0200, Tobias Schaffner wrote:
> Hi Steven, Gabriele,
>=20
> I am using the RV system for a downstream project called EVL (aka Xenomai=
4).
> It is a small co-kernel system, small enough that I can model the whole
> co-kernel with RV instead of just a fragment of it.
>=20
> The patches in this series add a per-monitor "stats" file that exposes ho=
w
> often an edge has been visited and the dwell time in the prior state for
> per-cpu monitors.
>=20
> This allows me to not only check if the model is correct but also to see =
if
> all paths are exercised by my stress tooling and to decompose the latency=
 of
> the co-kernel's wakeup path.
>=20
> I think that some of the upstream monitors like e.g. the sts monitor coul=
d
> also profit from this.

Hi Tobias,

there's been a conversation at LPC about completely migrating RV to BPF.
While we aren't sure of its feasibility yet, and it will take time, it's
something to keep in mind for new contributions.

First of all, would dropping RV in-kernel support negatively affect your cu=
rrent
workflow?

About this series, I believe we could implement the same using BPF maps wit=
hout
too much effort, then the rv userspace tool could display them nicely.

What do you think?

Thanks,
Gabriele

