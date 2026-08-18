Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA6237C92A
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 21:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089111; cv=none; b=Zh059oBxTtY1OabC6TeymE42u2Yh7d9NKeRdblUIX65P63o78TmnHyBXdB96FFrLMrrSdGDs9F1LVB+SzAakgh6sHRS9nkuL5z54snJ4mT7mJnIzns3ksJOBO4fFSOt9lVZx8uwnooM6fsQoeru7teQMO4+rdQYqKm4wXIi8ly0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089111; c=relaxed/simple;
	bh=GPinSQFO4keSd1Q5bC5YTK7Ezticd5+rWlEfu42Fe/E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pGNlRknPOo06jc9KagOVW7+IqPcS7TIMTxhDBcp4vpwk6m/SZRm66DBdeo0xlNNug8Q62kH3QhkBoZx3vLcYm/ZaIW0SR+z1+39s1DOTd6cHWWhAQDEWuVxEx5tGL3twkn7J+5+Heoy8W9Z+ZdI5oJdbxGsj2+KIkj2KpuZ27pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHqH2vfI; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHqH2vfI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so551880a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 14:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787089109; x=1787693909; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5pr8D9dTko0nm5cpxv7gLu3MP5nFNJnzsxpSKuqHUmo=;
        b=DHqH2vfI3CokoJHsnQ2zLyJc+J9LVADwT0fEANQxoIF4V2+R9fY24HG1QvTqD+SQv7
         7yrs7/cpYTV1RcV4ORupXm5oq9+NODSsrstcGeuy86MrjBkEPKZ1xGE9jKAy6KjBumvn
         j16Nl3Rlhd+27KFWoatYUulQNQJD9rymfk0cEOfHU0WVsBwKNa2PMwNmdD1P8KL+rJEP
         cy+qr7AXdFf3/rOG4o7KExAMBatknXXDPNlUKEtQOPIoAvv/7v7RyKSNtZE598C2F2x3
         OYH9XlgZR3Gc/YKfEdzZQ9E1RwuH+wog28obhfP2MGek1YtAAdXYlwnPZex6xd6HcUWr
         Ep6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787089109; x=1787693909;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pr8D9dTko0nm5cpxv7gLu3MP5nFNJnzsxpSKuqHUmo=;
        b=Ag1zHb30aemQKwmdLXYV5cfk0pn9rSCwfLCmr1hYpRLViM1WYam2EFSF5XvauqId0l
         DJn/bMhAEa7UhaiWSrn+blWhITmUJHtZ8gy+OagqWbRRLVcBD/zWatT0RFwIhLdzyEBs
         j9qPXVR3gXXzDcANQGYEe30zoKxYMerwej3iYG9cTOZnwh0eGuO1jShEL0t00mWQWPeL
         Ijvj53beksq7vPiQM8/2MXWt+d3VKYp60Pkmb4RJXt3jW3laClRMS7OJHO97FJFDJycn
         /QXB9ipnqMRLqw4c+DElEfC+TV1nPSY+Sz6KH1qMlyeaG3b7N986CkZeUBHPj4j3ut4S
         97xw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9ycwA+L1KtU+QxGoOZNVVZESH1P1mPJTyKJyRa1Ms1HaqKa6ZPrpP/U0DmLfh2rFoVoxgUGrZGp9aMEd5Q1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpHCbVHQ5TIXQoh3DGtGTW+4h9isH9TrUNd19Ur934c0HKqFT
	J1eBzdeX2vq5ZLXZBZMGADBdUKmpFT87dBcjdSbKMWRpXObEACAI8kqS
X-Gm-Gg: AR+sD10vc3X8Dbx97z000pkIzhGpEu/SbNQNSBB0dQubbNoDjUabuKuaRgmJ/vaTnl2
	xtSiU8I8bBH0d9+Uvov98a9SOZOR0s9nWNSHMydxVcX9L1dR7fpGII8FwbPgDS5puwR5Hn8fJV/
	gAtWRI1ccTCQjM5l1Vnoqq5x7wynH/hzAVJhPvLqQcBYhuuDKbne9xXbvd51W4S6LDB3AkfKg9r
	ZtfzYMNePBwEUJRYS0yMOj7yEdNTV2GlGYaCj73DP/FTNe/7dygefJK2z8KNSllrqncWz5eqETU
	8rPJud+9IScwz1a5qb7E0D4JIsPs0wPMt/owBeLANz9oT36gW/bnOvtTwwKVG7Y3ebs2Eai7TPg
	HrZdLPPkdBzSQIkaRkPcqpHcDjgSdok9vEmNHgwZ8W4hnlT9NqhYEwb5vlycF67FqdvpeTCB4KI
	+/SLzPvM8fVSbdWEStUFycHxOME+vQP6e+EQZ1PtJvj+QlrfiMqWYOG0dGRzJZiuyU2KMtHXOVM
	h0lP4eRp5Zzi74xKblQ+hwyAr4=
X-Received: by 2002:a17:90b:54c5:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-3957b1c5cc4mr1267082a91.5.1787089109181;
        Tue, 18 Aug 2026 14:38:29 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbba811sm122046a91.13.2026.08.18.14.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 14:38:28 -0700 (PDT)
Message-ID: <17813f00c2c81cd2588672197cc6d4de619ca36b.camel@gmail.com>
Subject: Re: [RFC bpf-next 1/6] bpf: turn bpf_reg_state->precise into a
 flags field [NFC]
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, 	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 18 Aug 2026 14:38:25 -0700
In-Reply-To: <20260814231945.3884596-2-vineet.gupta@linux.dev>
References: <20260814231945.3884596-1-vineet.gupta@linux.dev>
	 <20260814231945.3884596-2-vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-14 at 16:19 -0700, Vineet Gupta wrote:
> bpf_reg_state carries a single bool, ->precise. Other per-register boolea=
n
> properties exist (and more are coming), so convert the bool into a u8,
> call it flags and give the property a name.
>=20
> =C2=A0 -	bool precise;
> =C2=A0 +#define BPF_FLAG_PRECISE	(1U << 7)
> =C2=A0 +	u8 flags;
>=20
> Both occupy 1 byte at the same offset, so the struct layout is unchanged.
> ->precise was the last field, after ->frameno, and ->flags takes exactly
> that slot, so the memcmp()/offsetof() based comparisons are unaffected:
> every one of them stops at offsetof(id), offsetof(var_off) or
> offsetof(frameno), i.e. at or before the field either way.
>=20
> That tail position is not an accident -- it is where fields live that are
> compared semantically rather than byte-wise. ->precise is never memcmp()e=
d;
> regsafe() tests it explicitly, and an imprecise old scalar is a wildcard:
>=20
> 	if (!reg_is_precise(rold) && exact =3D=3D NOT_EXACT)
> 		return true;
>=20
> PRECISE also takes bit 7 rather than bit 0, because it is the odd one out
> among the flags that will share this byte: the others describe how a regi=
ster
> relates to its ->id set and are cleared as a group, while PRECISE belongs=
 to
> the register alone and must survive that clearing. Growing the rest up fr=
om
> bit 0 keeps a clear-the-link-bits mask from reaching it by construction.
>=20
> Reads go through a helper, since they are the common case and read better=
.
> Set and clear stay open-coded as the usual reg->flags |=3D / &=3D ~ bit o=
ps.
>=20
> No functional change intended.
>=20
> Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---

Sorry for the confusion, what I intended to suggest is usage of bitfields,
instead of carving out bits from the 'id' field.
Let me read the rest of the series to see how the flags look overall,
but looking just at this patch I'd suggest bitfields.
