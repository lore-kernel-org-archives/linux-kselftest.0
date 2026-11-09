Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794217340;
	b=pLINHIWkvBNAX+KTXGC4ewRpgHFv/wTvw2wIvUKpKonwyClk3kA7OgWJtw4mMZ/YNlGh
	 /RuVWHDIbfBOrB7riHf54Jdb+hmmmj8d0afPmvdvS47btxhewT0aiAS6VJvn1WzKaX2Jk
	 sfwJC1eiacc5nE8UkVeh+roe2vDcsIKr3LOdwj4FwYCd29tA+KIl0jTxL6UDnnAbfbeKj
	 LJsJ6hrzyTl1LoBf0V/Vyo6BthsKN+Awn8H6d/WJgrSBkGnexNsDSHYMjksWOuATxnixA
	 MuWpw2RyaSKwksT77xz0It82qYZf/ySnGQXS69DrxfOlkEDrhvsT/Y3Ax1b4Ja7eRow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dnTFqC7NFZ6LKcry7zosB7nFvDvPqEPM5rGL/V6wgTk=;
	b=jTsRNlFtFcQil4Nm1PYGLddneGvt7zU8soBjXHUPX7+iYqyWLW7FvXcXIxUpkiyY3Pvd
	 vrI4usMb0lyKN94VcKIlzT8NyHIktsa5qXw6LzTW1v8jXWPAK30CGPidIbbH1CzTj8Ps3
	 dWjGN5KkYs1so8mE6HPCQkZWE6KswL5L3uHDHJqY5K6j9qv6He/mu5d+8tp4H3p814Gbc
	 KffkWPKRb1w93PA+1yCJBd0APnWEvZ4a6F450Ut0MbCfF/bRJlbbdbwmiAwaSruU6m4NY
	 RDuAoU4iS5yrGrbsKVTwHWDNzZ9wVZVgMCBe6FqFl1iELqNaS+NfY8ITxgIm/kETucw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IW2nD7TB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C3606D80B
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 09:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9C3606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IW2nD7TB
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so3605e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 01:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794217338; cv=none;
        d=google.com; s=arc-20260327;
        b=IOTx/viApKGArPTMITZrEiWL18obi2M1CYJTDTMqZWEinEzi9w6faZLhHLrUcP5MYE
         1broKDRbxTlMYlXLsN18oCRxzqljsTjoIIZwvfdmSQP3GePm80EYTMIUSB9ngThj0iD1
         1BefoR+J34D8Nrm+gKqe8+RpRIk85hJeeJmQJJzXys+2WBOp3ZOINkrcZ8HhqXhbaIaj
         6HFBuGqg1u3ZtKr6XzGqiv8G0vThMwQqdLL6lRZw2ht2ljQdyuC3t4zO4luU2gMoQyZg
         ur9rtMeiWbc0YaTDhfZGsufLndFAXvJTTiomIpOVymyTG09ZKjduiVX0wz7UyidaViPF
         VQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dnTFqC7NFZ6LKcry7zosB7nFvDvPqEPM5rGL/V6wgTk=;
        fh=bDojKie8VPZcsmG/ZaEWPLOSifGx4qQ5/MekIG+3VfY=;
        b=XFesOM9FnzmpQtcAnpeqtsBbXizWUD0/J1Ixv4qhTbOunJ7ImbXKV0EIDbkCn/cT/a
         0pb/k2ZckcqnhoLmlKM1xWFMNqMAp7eBm5wKUm4aHXamIbeLJ+3RQLiHWUFQJaXi34tR
         Oo+eotMV7blHD6zc+WdinxXofE/qi5TCEkEHHbvEkVE5uprN0915RqheuZkUqtZjg9ap
         4OmGEmugwiXk5whw6yKrYLncq5pHxNTee8k50jSkPmGUr9Hpbmn7udmxzYixSpqnfRo4
         eEWYJnNf/UPfgVsCSlcGiIdyKU9ElZubHOp7IrxvXrbWsQX2x4hpFspEgIqC/jUKgaa2
         PjKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794217338; x=1794822138; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnTFqC7NFZ6LKcry7zosB7nFvDvPqEPM5rGL/V6wgTk=;
        b=IW2nD7TBfpylCv/Q4iwboGxtpYLm77TPNHjYntv3vZdOMn07KGEJ8Z+jzF7pqd73le
         R6C3pFcK024lUnAUYKpxEFVxXng9CqVrBsfIHokmvrFogJT4mwvbtoNbjyd3zvhbR9dO
         Tw4VheWTrTOXCPqeGvIvJzC0Z6HIIVEnDDj9Ns+YAcSq1balXLUBN48TiDzLXdzu41kR
         9VnpZtANr8A3VW8NxsBcw0PmQ4QkW8RflYfoiuG3LnC/PhIWHCa6XOWCsah8JQe3bTgn
         Z0femMdJtIO84tqoLbepZiwyEsrNjYhK8lTxSrG6d3YNLh0lwnObvVFb9AYP4xZUrn7u
         1R7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217338; x=1794822138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dnTFqC7NFZ6LKcry7zosB7nFvDvPqEPM5rGL/V6wgTk=;
        b=C/3y1P9OsFjmObFyKtpH0xmVZrkmLtygYuKIP1qRObdzUdMVFTg1zemlFOzj6Wr/s9
         8YjU7X7t7lYJ3qi2oHHGlim0wfyynZpzr0S3r3S376uJUCAFFWrm6EetGwsxW4W2dhJV
         aGWe1JTFd2bv7miCnZO8LX/sD6nldxUJ4y1oXVYv5O0mBpqpMJRf9dvVz8k0NRp5sazX
         hMmjdgn152b7L8s6n3o6ok2FfRg08aJcvXPlz9O8u98N9yd4kKAL6ZkTBBqNrtGzlw/7
         1le3B7VavBoM1x3Kd0q27xP6cLYnk+82MRHKojCwB8u/eGc8g1BdiKI37wgp9cat3FjQ
         sEXQ==
X-Forwarded-Encrypted: i=1; AL+hErF65VD7rlsjl7CBcyFgmOuw6I4HazpMHLOiOi6JSrIvYBeXsr56wbcelHJqIkr+pmhwWu7+dfX6KTdy9/sR+IA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y9Ovk61BW702lSvFx+UYdC0XoMbFeZoRnsawizSJnOeRebwW1
	wRO3ul9wNhtG0+wfscgwOcPLo2ypCjAPkwElJaUw6n+6xdaQn6EIZ6ab/e1hd1l7KUYAJgOWBOa
	/2gQBwC0g0HXpgC06YJKTFVqJu0yM73P3JwQpxISb
X-Gm-Gg: AYBFou0OkkavpcUN2IIwsHHRHmoMqot2gBvPDzcQtSe4JGJrEkyFgciGjF+rDeuHgEG
	MPkPdUibwkcgaXL5pw0NBbD6UmY66X817zqsd5AXW0LBQ7pCiirEOrj/ICTW9W4IRCNQLGOZCwx
	gMwy90gYtTeTbhTsEG+/3V+UoM3AH6AuLifvusQDPyNW0xwkUWqiQw0N4rC2y1joT/mYyB1PYxQ
	Ryz+NKVeYQfQ9UfQ+ap7vd/lcLvaK7aqDCHRgP3OFkTyeZtFJLtIyOZas+R/UIgIQ+6uVIpAt3l
	kfGEDjjeJ9ZOXgbQZV322RbDRFm+KAElsIWtdJ2ApceU2a5qgQaCBJR9rGIfn2PvUMgwgDXbVf9
	RS/0tf4/9iZTqrXeqUyoiH+Qs47IpV2Fb/BJnFlA5ika43Ke3+/yv4RJNBl9PxrC2dSUx0xoxH3
	thYkJzPpLvLRylxk/9i6kZ3mibrShzCisFb18+Y+R4wGj51OE=
X-Received: by 2002:a05:6512:304c:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c00bd5bc9cmr144934e87.10.1794217337930; Mon, 09 Nov 2026
 01:42:17 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260922071945.693714-1-fuad.tabba@linux.dev> <20261007074037.316564-1-fuad.tabba@linux.dev>
In-Reply-To: <20261007074037.316564-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Nov 2026 09:41:41 +0000
X-Gm-Features: AclHuK_MaYET6PTkt0ZnvA66k0DV_1M55e3jB2HzY2bpxHczb0VPvo1hIAKLqfY
Message-ID: <CA+EHjTzaJx2nV_9YEExgYn7STSP1Kvhsqan8va8M7ba4WtCiqQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Fix incremental build dependencies
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	James Houghton <jthoughton@google.com>, Will Deacon <will@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean, Paolo,

Another gentle ping on this series. Is there anything else you'd like
to see before it goes in?

Cheers,
/fuad
