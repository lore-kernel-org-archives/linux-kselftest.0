Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313037;
	b=thuZhDtnQ9zSfuh8i+ogqLKIiEE94alpwGcCzPcK8yV9mILvHdyViijeWyovT+f+bwdh
	 /KGnaTgBR/7kmGUtYb/hGGt6Q+NX3QC2+3PsUvBFvYfTBDeGW1LQIGVn15f9LGWhG+PCX
	 af9r7oM0Yhsyu+Ilxu3dbU887KfolczqGWGYru77lYbyacRflyZkN3tZUKSQRQmvFNeR5
	 gcSx464nU3P5JSwDR2myMEx5SJU3UbLuD/Nm6jmMF8YmSojIK1V7lHOmWnudP/HMvVIoI
	 CndyFwYHQIwrGVNJ02U4UFAE5s/wdcL0Z0dk3AQQ3WtFh/czMQEv/fg08kiopREwY+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=raAFDgbKNrzXejiq1hnLYOYiZSgol4DkfmEbVso6mO4=;
	b=wt3NDA8sKwWTiLyJf3U9fXHTGvGaoxWWsOwu7396mZtTGfaGotiiJgrpIp+ReDXXP+sc
	 M3M0E4FoFoWvTYUrOKNEaU9QAKPPyPCTLKH1RnvtXP7NZ0wL5rVPZTLX1KqRJ5SY56XTQ
	 0Td20ixBHs1oagjYaOHYuJXzMusEVCIXBF55iT7GtMwNT3VLGO4Dxx1vXSf9CLab4YXV2
	 4j8NKU7Pjpc//YbgFJ514FV9lpjthZPgoZ+YLuTwNlsmvcWZ5J2MoMz2gd2lhs3QAXHPz
	 zdLctsP3O3F7ahIqT1X83TwjskceSdmIgMtXDiN+Dd5+RnvUZ9Vj1CwioLtXAMjov7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7pPrL8E;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B9606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7pPrL8E
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2af4c8d00so137512c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 15:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793313036; x=1793917836; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=raAFDgbKNrzXejiq1hnLYOYiZSgol4DkfmEbVso6mO4=;
        b=L7pPrL8EEFgeiEVXzTHbv9xSTZF45Y8UW+YkiZZZb5AzKUBfVQ9wXFtpSo14fUsVGY
         ZRJJXpYxJa2SrVd4LH5AlZaA7iSE6+C0UmUABUX4BfMgZtbLHSlud9ElnKwkKt3mC6ez
         q04hvGP46yVhEcQfXFbc8jepoQQNenhjPhvFXmTXHxVQ6ZRsNsNFjL31a9752fnsx5Xs
         x6RE61zO++ScNkkyZZBelSEeHLGHiBMnYlRN4aOd2MQcoLZ9ans3r2NieV/MYbB/S2vt
         XeTprG7GWae92hFwSuyx1LiAbOj7Old7zMVXOiRvqt25+ZgI3GoWracTpd78j5PkNTmS
         Vm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313036; x=1793917836;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=raAFDgbKNrzXejiq1hnLYOYiZSgol4DkfmEbVso6mO4=;
        b=WsWv9wWhKQb7yRYGVb9eAaGEOStQhDVRk6PGWPMnVNIPwu6PEECLRt3Jeg9iiD579K
         izoBX6j7uyNhYs2YWoCUosya3SmQHwCWEAP2lO5lL4jMSKb0IPVeBqR2i8yxVUToGHEl
         PECSwf7lDLZ37yF3KoXXf30Zby5WmDFo9pfOcXAhMbzXv0p37bqQ5JDqA/YB3xS8jw29
         C3gbLla0nistaV7C9GJpllv5kwbkVWYQIw9GtGvOWs+KGSXOHAUpHJhPkQMKDcrHkac4
         Uicc9sbduGv8vlTSoPzPZDQBfrVlqk0Atc8sYOTfPKmmKZPf4PHJdx9nc6qCBzJAYMAx
         X8oA==
X-Forwarded-Encrypted: i=1; AKwUvBwQRyT/gUHASiv3fWwYArHvAWOkbx3qT5LbNy21NLzEqPzw8wIMCzEOqftB46BBeUgyfcZ97On7RXJY4ZNYjBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/Uidl7wpTQU8Vvf7iShIaCZokDt2uCd7G+wt3SNlWGXVH7P3X
	wxo278UtlkG9uig9gIK+rtEnaV/WzakXpqeT0ZemqOzebutLlT+ukyqP
X-Gm-Gg: AYBFou2GUC1Lf9CXWICHfuW5/uKGyeUM6YKxzOISzy56lCPc1Y8W8ZQdmCI7zS6MflO
	C+RErYSlYrBQMCXFT5gsKxrWUS36cocuFlBglFJjy6bCOk0U6dVGKxVMiunF4C9DsXJqwe1N78d
	8Pskv5bowGPtxEudLba9FYYZKV9gM2C6ibMIZLOSqzBw4ZUOS6eSsf/d0WqAoytukHiWE3Hs5kH
	Upw5Iy//9H3KU9jE6sj/8/IxhxL2/WHijCmf0HmSY94wQ+kcRQ0YC4MCw71CF/G4AuuFNyYEnCF
	s/I3FcU9NrkqSjBBZbOPnv/4XB6FZmDh9fd9fFWSZXrl4FlZN8jz4Oaamh0/4j2pCta2CCEb3JG
	TyHobiTH9G8WEY4RJGVH4LDHPqCTgz2jFwEDkWfp5PqCHLzcOT0Gcnvo8rFrNmHILAEgy8iNl14
	Gqto1aSNGleEYuAvoJ9hOvpk941PE0ZC52alhXrxggnSwnU7GD2yFtd8P5QNoKo3ugBiapXQs+4
	CYY/Fy24pA+twmkXtMUBPDmGQ+UVI+ZJ6nxHIfKDCjVzknCLvg7NxhGn1/vCnr31mXsNQRzJ2dA
	olbUa21n41edJmenhv+isKuchlTFJ/6s3OfWVGlehWG3DdQdEBfCsIPQuQDJbwvKDomTrn17gBu
	Msc1veWQ+yWo=
X-Received: by 2002:a05:7022:5f02:b0:166:862b:9bcc with SMTP id a92af1059eb24-1ac5ac4caecmr596289c88.18.1793313036057;
        Thu, 29 Oct 2026 15:30:36 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:cb2e:96f2:5ce4:2074? ([2620:10d:c090:500::4:5b14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm1459038c88.14.2026.10.29.15.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:30:35 -0700 (PDT)
Message-ID: <9720ed1ff19dea17a1b379c02d7dd52ae886d807.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 01/12] bpf: Keep the 32-bit range across a
 sign extension that cannot change it
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, 	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 29 Oct 2026 15:30:30 -0700
In-Reply-To: <20261020161907.2115379-2-vineet.gupta@linux.dev>
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
	 <20261020161907.2115379-2-vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-20 at 09:18 -0700, Vineet Gupta wrote:

...

> @@ -6192,6 +6193,27 @@ static void coerce_subreg_to_size_sx(struct bpf_re=
g_state *reg, int size)
>  	if (reg_umax(reg) < (1ULL << (num_bits - 1)))
>  		return;
> =20
> +	if (size =3D=3D 1) {
> +		field_smin =3D S8_MIN;
> +		field_smax =3D S8_MAX;
> +	} else {
> +		/* size =3D=3D 2 */
> +		field_smin =3D S16_MIN;
> +		field_smax =3D S16_MAX;
> +	}
> +
> +	/*
> +	 * The range already fits the field, so (sN)v =3D=3D v for every value =
the
> +	 * register can hold and the sign extension changes nothing. The test
> +	 * above misses this once the range straddles zero: it only looks at
> +	 * reg_umax(), which a negative smin makes huge.

The `if (reg_umax(reg) < (1ULL << (num_bits - 1))) return` check is no
longer necessary, the new check below subsumes it.
Please drop it, otherwise commit lgtm.

> +	 * This has to precede reg_step_reset() below: the extension is a noop,
> +	 * so the base/step line still holds and there is nothing to discard.
> +	 */
> +	if (reg_s32_min(reg) >=3D field_smin && reg_s32_max(reg) <=3D field_sma=
x)
> +		return;
> +
>  	/* See comment at reg_step_check_unsigned(). */
>  	reg_step_reset(reg);
> =20
