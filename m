Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792244;
	b=MDbKTqXitTBsgsRtVH+8LIkAnZNEsQpNMBf89iZRp3TUHBycgj93B+CJKauf57PW+LRZ
	 LqXG4Vqir0X392e2lun54guU6XEQy9ZqBW7qHQTCXoCogIwXfHCZaq2HQ/Q7wns5KFLmQ
	 aSajj949yZKrb130bG9kQHg6f8W7tfH8Z6Mmyhnfj501cTxlZtj+AcSc3dpkn2OWxOPsF
	 eWCeu0Fi5wWQGd18V1sS0ZnqepNsHO1FVa02niwarfogOsjhuMC6674ejW/KD7RWKtde+
	 9GHqIodiBFqibuvgK0wVxROW0kkPeBCdGDV5HfrundCnoLieLMlOsliixaSxzUW0eYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792244;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
	b=1ILLD3DtLitgc7dJcd3qbnIVLgSSwNzU1TBqxaLPPGPkENzPfIWlcwTwL8bc3ClyUCsV
	 k3WWhxHQ0PK2cuik52vettIQ2wN1rmkmK4+AkVMEVuOHanJElt15TbeCjlQgBd+Sm37tA
	 d6VdB3u9ThXXIMHeKpbuLM2yAF2ceibQv0JQI5VT0/otebIeySE1LbPXbSTC89snt61PA
	 U+PsFFCXJMlQZl6FEAcqIUcP944FjKYotyU1ReMGLke349IOctvdam/yq+lagXhinXUGy
	 Cf0I739/ZOW/o7bqtfGX8f2C/Z0D9dMnyfe6zIHngze4qnnS/rfPEpFWl4u9aZbxHYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gaBmgHR4;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e+BJ19sX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FB9606EE9C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 11:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31FB9606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gaBmgHR4;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e+BJ19sX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793792243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
	b=gaBmgHR4BR5KhzzjedYykjxmp5nDN7co/1bCU/XsQdNXpGylT5z6TuJdOJovX9JFETJ2hA
	7srHc3RDZnBORBpQSg8XIzy8aJqZW63WmXXxJifinADfNHVLH94TrCVBLltR5VfRi7U5fW
	2+PvGYQGc2LRBen0zkH+NWF9s30KFQ4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-UB1jZxKfMtqq_hmlgQEEfw-1; Wed, 04 Nov 2026 06:37:22 -0500
X-MC-Unique: UB1jZxKfMtqq_hmlgQEEfw-1
X-Mimecast-MFC-AGG-ID: UB1jZxKfMtqq_hmlgQEEfw_1793792241
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e011829easo393218f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 03:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793792241; x=1794397041; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
        b=e+BJ19sXHDIDQjJBttZD1l6dXkUHVjAVK2T0XmUuCboYncRhk6ePDwuI1Le2S0r+h1
         HH39dH9YuLl5WU9+YAx9kglkF4CcWHnLqnLCiprDMCtj6eMDzQSqy84qcszXflg8X8yO
         rol2ivdA+/hk2CTosF3o3SBTyXOBqmSpd2nHSwNM6wOGnG3JBcjss+XD234R1GLsD9uO
         dwMq9QtK4oaFuC+EB2OFdi9WKTZ8fRiJSbOcocfT2qkv50Y+IgKwNOqyT4lQ/IzX+xhJ
         hVd1AwCvfDdWqdd8aRmGRlzZp9WrHvtKZung5IFO7kxhex2j6A4urhYsuLMxo321t/Jz
         42Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792241; x=1794397041;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
        b=oykozkF01UL1/AQTf44hGvAqkA51aQsTcNoLiRYi4w1RYM6mxPUdVro6cKz1LHHnGo
         Jx8idyF0k5EYddXQ9TeWrhlWQNTa1TLQXFrq87s8arD/k7Mp8mLtH+6es2VSuCp8aaM1
         h/vTukAWU71Ru4OGx0rkgsbLjNaYEuY/qxjtnBMDFjPAWLRnUgyaGTQsDATApq4l+Iwm
         jcehZGiAZULaKzWcvh/mwnSZFScJnzH1+LnT0hSWd/O+IPD+vCThjpiaojcOEduOM1gN
         7/uCmsQE00cE4LKkMaoRBLtbU3dZZNQmVxBcGyTLnHKq9eaOGhei2q1V/J8LefPK2C0o
         bo5w==
X-Forwarded-Encrypted: i=1; AKwUvBwmJsgs5xL1TUestjXWhblwsT21/wimpLzvF3qaYK+kyScGM+0IOa8K7AQc5CS1riJ/4wun4ROBSejIaZ0KYzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/RxoBfB6SJ9wgTwKzIHrPTZADjSdZCONcqhX+vUS9aKcb3BrV
	YNR2BlIE5hXuzoY8o4xsqbXjnCKvSH32HASskPgaxRBeXvkk88TqenUjHFrk/D9tjiIw1HuKOBP
	ZQbPCZnM181bQJfn0OhGo9dsLq4NbitXNMBtBFbvID9qpwf1crzEOm9EJKu+JbY/eWF7AGg==
X-Gm-Gg: AYBFou1YruyRvbocQtzvvC6jB0GXirlkfq0oJJwRrpXKKcqLggwEMsiuWzkwKZd+YC5
	suuDn657wArmnhEp6QY4OXB2pBBfg7YhR7+/mzqoy6XXuMbvrTxPjiGkhUIYh/NoCBKC3niwrcc
	GIUoMGGjWOuYTPn59icOq9rWQlEFE5zUz0ePJdJ0ae/TM2QLihEIFFbPSxCG1waNb7stasaeGKM
	cnsdcW7KRRUUdlvGkWGbbCQc+Fbr/iBDPfPu6iii/uZ87GUJhGguxkPrhDeNZA944oRz9hdukul
	EpCRMMx08nEI8vwkklIDjdKuGRr9IXwyQKqWdUErNUyVDrGyt0UjTMjDpc6LV488orFmr9ZhPKG
	CIhPxK354RlA15EduOjOwbB0g5R7lFJxKG6rxaMrjuRr2tvZLs+JLmUkMWTEnRXweVlc4ZIm7Xk
	Itk6EJlmJTZ/8+HvHsIMcbQytl6boCZVloOBOLmg==
X-Received: by 2002:a05:6000:260b:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e6e50075cmr31750644f8f.48.1793792240845;
        Wed, 04 Nov 2026 03:37:20 -0800 (PST)
X-Received: by 2002:a05:6000:260b:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e6e50075cmr31750621f8f.48.1793792240514;
        Wed, 04 Nov 2026 03:37:20 -0800 (PST)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de. [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99d67sm3430641f8f.24.2026.11.04.03.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:37:20 -0800 (PST)
Date: Wed, 4 Nov 2026 12:37:19 +0100 (CET)
From: Sebastian Ott <seott@redhat.com>
To: Mark Brown <broonie@kernel.org>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
    Oliver Upton <oupton@kernel.org>, Ben Horgan <ben.horgan@arm.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-kernel@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v9 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
In-Reply-To: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org>
Message-ID: <7db30970-dc9c-702a-2f1a-f52c2e253494@redhat.com>
References: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Tue, 3 Nov 2026, Mark Brown wrote:
> While debugging issues related to aarch64 only systems I ran into
> speedbumps due to the lack of detail in the results reported when the
> guest register read and reset value preservation tests were run, they
> generated an immediately fatal assert without indicating which register
> was being tested. Update these tests to non-fatally report a standard
> kselftest result per register, making it much easier to see what the
> problem being reported is.
>
> A similar issue exists with the validation of the individual bitfields
> in registers due to the use of immediately fatal asserts. Update those
> asserts to be standard kselftest reports.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

For the series:
Reviewed-by: Sebastian Ott <sebott@redhat.com>

