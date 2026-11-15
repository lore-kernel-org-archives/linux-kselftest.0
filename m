Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755197;
	b=iWnLBZi1tBmAMA1QU0gBQ9toViVs/GU2gQZ+/+ubcQsUeog2R5rFFfBPygVMdm5fdAV8
	 28BZn0lEu4074mGu/tdtKivSJstqjvkptnc+dNXyWYfU63l/Y0tLn5v+xmP8zpGgAGTLt
	 F3Rk3md3pZbRmu+wdKqGcBmXW75U3gC7s/I3hFDUDcw5oky11cp5kQrLxpMKjxHBO9rSo
	 jKHJNn5wnqTtSNNJBoU88mzqzNiV4uahO4abocItPBrFtVQfEVGXRREK5rZKJVU8qWIn0
	 2jEb+9DT4Pcx25tEE4lsJT+iPZdo0/mqrWuUwB6u0puRG1mrWjUYzu5usUOcOuXtYFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y/hOIyUcvAfKlaaXm+bgaXHbjM9PJioyHvxOcCFmCQQ=;
	b=o16ovM4fsD5c5bj9FVESwWBkYv1Z248ntbqPwZCXLg/P77R8TDFxfJZP96VlmooLHYj4
	 yb4LZUmRrme28SNooYtzoHmsmbPxLpKNuFbFHkhkQ9sqZn1sU/QjJE1MrYXEecMtEVClJ
	 3tT8NPh1RcXZ1gyaX4Pdu8krBCfIOHk6YmrrClrXRCVguYGJOdUMCMNiYhhdewzQ4dJEP
	 jwymDiTiGsmYuzp8xbpQII9UrfHzll3AuZNTkVIgXS3XFtBM4JqWn8mh6U7WLZ2WHY2Ls
	 vRXKhB8noINQeriVzXhbtDJVa1q3QkX77rJycFiCWInUXm+QwAvbxqusLqoXLbPsrOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2CxOg0u;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F867606A31E
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 15:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F867606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2CxOg0u
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so7681565e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755195; x=1795359995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/hOIyUcvAfKlaaXm+bgaXHbjM9PJioyHvxOcCFmCQQ=;
        b=A2CxOg0u4nA5j2QwWMCX2xov6hIZN16xt8onwYD8iiyiAmefaUJoMWy7xFANfTWq3e
         b2Vw1nSe0DtU76RQo6cvDZJfosmWeIYVTT4tvIbqCA21YFldIqfypY4/lOVrBjY5f5Ws
         4fRK9yBDQMVa/LTBdWIjf4ivi1vmColGKsZo/1rnE83gpKiU/Hwvi2dCjToI04dcUG99
         5Cs/R7e51IBr6ubNPMl7niPd4VnEjeUzqhpbUDoyd1rAVesZRug/8vJFXr8RgwdKvQ8o
         L417AZpEqKuwBbhYDbV7yLkjyrKK8uoDyka2WiK/Joc7HZfWKIaZ0UcTG0SeY7b3XiFb
         kBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755195; x=1795359995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/hOIyUcvAfKlaaXm+bgaXHbjM9PJioyHvxOcCFmCQQ=;
        b=CiNYX+g3GPXQXE2Sxxro1CyDBGY/yzl0dpU9+4qwkOuzPm+drLJKIAH5H9Q9+276Md
         yQOdRXe//b/kehSfpVl1lcNZn+zYODui6DlSMhnqeEgK5PJlq2JKOwzkZ7vFGaWxNATX
         SRGZHes6cVjbbEH1cOWhFJ3KgSp8bYTnUHm3HYyjm40bw/8FrIvLz4KC1LtJ56TrgW2s
         bJTsm6GOsDIdCGJZsm1srv4vfoTJq3577upSRRssAnZ/BtzFaNIdh73+CiJGgmX1jjS6
         2iz9kW4TJchhSTlzQbkkea7CiKiq1QTo7Z0ADR0GIRVm6frAVjozgatT6MzNARzWMlV7
         gYvA==
X-Forwarded-Encrypted: i=1; AL+hErH8sFapQGbR/cKzPPe2f5Ps5OqwbrAd2Yy9/VWoCCIe/Bm+gHp0/j5WSV6OebQLHFhnS/P306g7C0nUsxdsGuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cqx110XyGMG7foFA3tnfd+XotZNwMp4XiBP4n6nzO72Nfbgew
	VmcnwabWckKkTnDCTKVyg99QrXd2/1UwRBLXwI1xIRWYNTWOOYbCUH4A
X-Gm-Gg: AYBFou1Oa8XF15mIcQeov54cTrxeW7AtBFY+fxbgbrpO6n0HLF1dEYvHks55z90nyUu
	KiIn+gfG4Nz2Q5raJrBRbQasIZQu/GN5fKORXIRjKW9szzJFZ6sg8+q7/b2hGAObYc87OH+tw0M
	xVH7+e6DPPZq6Nvneq9hR+LFGbR17R1SZjOjnb/9yacNMRt8mG9eScYkovDSC3ipgiQWMnpSxwE
	E1VeUL8LglbSpxmg+mj3fBr6v863KM201Oy1QTCIGVcxFN2H5YvXKz30LPGsbF9Pw431R7Vh8wH
	p1rTAfCBhmUmiPyeFlJUQoHUbAkubamYScj+uqC9cFMgXZW9uGd0CEE7+/1ney3e5BhjGQeQ40a
	U1TWddgGIa1LaiSCyRnWfdc9D/LS6vMsFPRMhTZHLnFju5in/mD0aXD1BHXspn01EvYL+h35xz4
	tuHhdDFG7NDITGyiRlnB2/FFH9ms6vi5V7q5uefQaMH+JJ9eH37yxAPY8cys+RxMu2ph3K1hPlq
	nb2RRFiV4mGjLFhAQ+BPoiY4+py+cRRRsjK9WLznm+C+roR9q4sshXncTqd75TdURm6uy/hhqfI
	uze2JWZZWydISoO++tK8pMQXk+gZgLkdMG7jV/eodAYOnjl/KX4hXOx5ITDS90VGcw==
X-Received: by 2002:a05:600c:3551:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb55abdc18mr178633625e9.33.1794755194903;
        Sun, 15 Nov 2026 07:06:34 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm17236146f8f.28.2026.11.15.07.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:06:33 -0800 (PST)
Date: Sun, 15 Nov 2026 15:06:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: andrii@kernel.org, bpf@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 alan.maguire@oracle.com, shuah@kernel.org, alexis.lothore@bootlin.com,
 luisflavieira@gmail.com, ameryhung@gmail.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/2] libbpf: Fix sign extension of unaligned
 enums in btf_dump_get_enum_value()
Message-ID: <20261115150631.3854c17c@pumpkin>
In-Reply-To: <20261115084923.53182-2-dennylin0707@gmail.com>
References: <20261115084923.53182-1-dennylin0707@gmail.com>
	<20261115084923.53182-2-dennylin0707@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Nov 2026 08:49:22 +0000
Hungyu Lin <dennylin0707@gmail.com> wrote:

> btf_dump_get_enum_value() reads unaligned enum values through
> btf_dump_get_bitfield_value() with a zero bit size. That makes
> right_shift_bits 64 in
> 
> 	*value = (num << left_shift_bits) >> right_shift_bits;
> 
> which is undefined behavior for a __u64 on both endians. The path also
> bypasses the signed loads used for aligned data, so a negative value of
> a signed enum can lose its enumerator name when the data is unaligned.
> 
> Fix this by copying unaligned enum data into an aligned buffer, as
> btf_dump_int_data() does, and reading it with the same loads as aligned
> data.
> 
> Fixes: 920d16af9b42 ("libbpf: BTF dumper support for typed data")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  tools/lib/bpf/btf_dump.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
> index bbe86928b3ec..a80762a70cd0 100644
> --- a/tools/lib/bpf/btf_dump.c
> +++ b/tools/lib/bpf/btf_dump.c
> @@ -2329,16 +2329,11 @@ static int btf_dump_get_enum_value(struct btf_dump *d,
>  				   __s64 *value)
>  {
>  	bool is_signed = btf_kflag(t);
> +	char buf[8] __attribute__((aligned(8)));
>  
> -	if (!ptr_is_aligned(d->btf, id, data)) {
> -		__u64 val;
> -		int err;
> -
> -		err = btf_dump_get_bitfield_value(d, t, data, 0, 0, &val);
> -		if (err)
> -			return err;
> -		*value = (__s64)val;
> -		return 0;
> +	if (t->size <= sizeof(buf) && !ptr_is_aligned(d->btf, id, data)) {

Do the alignment check first, you don't expect the size check to fail.

David

> +		memcpy(buf, data, t->size);
> +		data = buf;
>  	}
>  
>  	switch (t->size) {

