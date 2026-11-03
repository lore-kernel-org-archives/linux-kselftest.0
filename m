Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723092;
	b=edtIuZRF9pUV5sabPq0LSl3BJ/4zwMEOm2uoPC9lviJ+pa9/y1s4K4Y76uiiEI86/fKB
	 XJCN35SPXCePdElnzbnZ5fTYy+DzK8FttJxXpZERbHZvaGt/PkJX/lI9UjeopdpbRlbKu
	 vvwt7VuykPlS77IKeMJnmHK5XYRvxv9B2lzNrTQR4iBhfDpQQfu/k6DvdKoBkQb/yZ8Pa
	 wC/91NXh28uCapDZ+6TYLKV6tzsqBRx2W3MSoPre17cz0NUHm1VCwaDYsnIOiziJadedj
	 2IoF6Skxggh39NqHn/+r9+W6rrB+HPGC4X55UDpwX8IxZArnMCpn/FXHz7Ah0soaSQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=p1EhQWCpiUV9JPGwY0AZ8TPRcbxE7lJ0JFq7I1C16cs=;
	b=XafvFMSAAs6XZHacjBiyAVZbiQ9I+8Kl2+I1hCimkQgm84b76nF05yY5MjjJTHhm9iv6
	 NJoLMcJ2bLPoYdGcq9tc8DSIW4tjF5wcoA+uaElhmgx84O0XiRaSFWLT7wmXZNFDb9ous
	 sXV3w7TmPfmpdqIVQSMZ08nbNCH477cQCMO3r/fjyGz0czZMDMkMgIppHJkCQvRrKBCgw
	 PzqOqeL5vmtmc0C444boobhb6APQQSb47HVZwB6Jv4YIDh4g5305Qf5F+PsVBmmbE+rDa
	 1sKNmFCAx84GOjqBUrrahHLNs8KG/a5w6swmajocZXI+3ztt/ICzh80I+kswCclzsNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=Gl9krjaE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E44606A336
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 16:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E44606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=Gl9krjaE
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c414e5d282eso524462666b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 08:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793723089; cv=none;
        d=google.com; s=arc-20260327;
        b=iil7KZYQ0Mrxpmx3kfhal2pR7/2ON8hNuyMBFcgwYyQbUmhKfrj5qlRdakiuIgEb2O
         25XQcUkKwEhQ+OW4G/fE3FyDn14JGiKaoQ2zfIsGtQpKgYAMk/As5d4zihxh4M/k8+eg
         zUe49YkDxA6vWYIoFGfBePjlup3YFxdB+QX3Z5WUZOIiHAtxvGG7x+RuIYJveTCwjaIJ
         W2bCPs/5eQZcodMh83RHpHCUqHTiQ4He2PTdUodTWv9ep8UaQHUs2D7HQ+quNPOd9mJn
         CurVNXPn0ZJK6zAEG7RmsUloejSLzPJNgqhGSsrKIj/GxdYqiA/HuxoUzZMs9P7Xv0x6
         nhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p1EhQWCpiUV9JPGwY0AZ8TPRcbxE7lJ0JFq7I1C16cs=;
        fh=oo1Ww8/p0iAsvDLeXBy8jMIKucMn/n8TXmHKLvcbEkE=;
        b=s0GEx0Xdm8hSu4UYWiOr0dOAMx1MWDdczUC65HFiLDDp4AXi4m1Lob1uj/OzQO63BL
         I/KOu6AcwQGGpEx5LM997uLRISiEvZ3rfG7K/5qpjXdQWY8oScV2GOjRyQOvvftWb0AI
         Y+pNNXjexdiyu6V8fxqe2BeOYqzRWs4TkS+S6pOzfZgf2ufBtPwCBD/17MIL1eeGE4h0
         OFDV5qicgQ3nGRXcoXSwX0LLhS+epfK+KKQvK5jRzK9MMBM2RLNwf3dDn5xv001cFYg+
         FoODs3tPmNyijOEs76LTCHT0oJZvbmHBr69ZjXYDgWB1D89bpJZtc+CCq3LBpAzlYe88
         IfHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zx2c4.com; s=20261015.g; t=1793723089; x=1794327889; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1EhQWCpiUV9JPGwY0AZ8TPRcbxE7lJ0JFq7I1C16cs=;
        b=Gl9krjaEAxbZtsfWA1ym49rlFpCMF1xIZlkNUHa/bDARlRxl3pUFAysmpgzum7cJ2i
         cO6gelLizZVxstcXM2S+3ehwMr+rd3/sBQd51sl9lTTGpOwWraIDrIcyjjJfY1EmnNnp
         Zn3ptT/w873lIGC1NCiNgW0wGNGLmGn2alAxojLtcJaq68ELIfivjfN/XSTdmhkKgk+g
         2JbBzm9veE1Nm2vyLwWiv8qfZnGp/i/Qq+jNq9Tk6+cZEkAzuXanm+t46b9iMgBxCfw6
         ATdYpkn7pnj5lQrkKgJB3ABhX18IfBXbj2/jfh3YFxtfF31SW2vjN6bPSNIgnOp31bsY
         KXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723089; x=1794327889;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p1EhQWCpiUV9JPGwY0AZ8TPRcbxE7lJ0JFq7I1C16cs=;
        b=Kimhqf/i4x87HU80tRYaQbuf/7csiUV4LfdtfaHMgmC2OXvLrKxmOgkypfAF9JaI2u
         6ECOPkXMsAkCAEebtjmNnetMUztBizGa9s4V9OjzIGAkzYvYlqbzNessjjcU81kYu4ba
         I1DWPcF6MfrNsH9FTDme87utRBnOiBBBIcAhTOriAJcigFyYJGWp4mEYOYsUxOXJ+ArX
         eoBZ3WrHDqU6iLa14OA2D99sDwpxPCm6g1pEzg5aHnrXb1iX/WvuFweH8pOuICYInpuJ
         a9VUcUUH/XhpOC0wqo4ebouw2/gI7py7nEcTzAuBWkPKKhJwycal0o4t0ycO6e5iNoly
         YCYQ==
X-Forwarded-Encrypted: i=1; AKwUvBybwsUqwxCUdI/872GLR6JB4MQVOX09YXE1jiDK7DDL8w/tP/FlCYQtZNJh8Grc1atZwzM4l2P9YpjQZS6JXJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x/rVJ8fg/BD5/ncObA9DXT6Ykijp/BGc2/33iNpEzMPdACHAh
	cCftGb1rxYEhv+DoP0dpYvRR+urbaqRQ3mOMO68N5DfpZe3V8I4iDHTxDeBqg1AGqqMJhA1Vu2v
	rrJ2vSAqYxznKh8DleAj7TyAdvLDqtw8tZqcamwvi3QI=
X-Gm-Gg: AYBFou0/oTtTQ6lAfwZ6p8dxqUD8KveXBfqKROhgQq3TxakpHKQ7wA1QS38yq+pTxL3
	bY9KxddMf8bjjEUGN7bWK6XAOjLPMlhjxLL5KxGTEq6oWOzwk15yCLW1Y+7/hzpoWgVXP7btytg
	FHXo99VjVhrpLmu9tXVvu19SqvrBv0lDpeGJcY+5TE+mmemTy4ZJxjEyLwwMR7GORb5+nAfpl6d
	KDcYh04ANmnm+x4cW/6dJGfl7pPn8ECAzyqSunlKHC6AfcN28Mg1nF7T59aC68p952i9g3+NpI4
	Pksfmr/4hADpFmNCI9QiWMzfCxoG4QVsqNDylQ0PDJFbIPyYsZECZhU09OBkfgeMpo53KjYi85W
	jNc+ozCezDlNDoVvCV0nt6T854RHMX1i4PzCHTrBNLe76kipWxuMBfNcxDOnRNkIcnhljd62HHL
	bW6jJNTX1k4lzxozKadpBkl98uMMZ0z0QsfQSaOsIvoVapulYeAQ==
X-Received: by 2002:a17:907:96a1:b0:c45:d8aa:6ae5 with SMTP id
 a640c23a62f3a-c4ca7b605e4mr1160958566b.42.1793723086660; Tue, 03 Nov 2026
 08:24:46 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155514.535166-1-sashal@kernel.org>
In-Reply-To: <20261103155514.535166-1-sashal@kernel.org>
From: "Jason A. Donenfeld" <jason@zx2c4.com>
Date: Tue, 3 Nov 2026 17:24:35 +0100
X-Gm-Features: AclHuK-FjvZIQdV05OnNbeVErl0LLmlJRmNpUdovsHS4cJNG8lnWpwMwupa5IHM
Message-ID: <CAHmME9raSm-JGsyYeqFGuq0aUtberNTN3GqkVGNtS0_H902zJQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: vDSO: print tv_sec as long long in vdso_test_getrandom
To: Sasha Levin <sashal@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. I can take this through my random tree, unless the vDSO people want it.
