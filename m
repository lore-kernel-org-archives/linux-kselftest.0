Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393279;
	b=YxawMvoo9p1ZGe6XpHBTggxN0isSwRebMWo5VhpgxG4CrWJCM5PcZoGFTIcAS2nN7n+W
	 yQtzM3jQsl9+ZZpcw+Zt1SnhUmGuKlnW/P+pNbYDhBL5pyCYH3XFbqm8UUXnw9jR0VzYy
	 IajxyomrHTLSuTcIImYzvawfUAjpbvIBk7t210wRTjVUWXhWM/LZvOIlQKcEKU4s5e4oH
	 w7LyCrudghA+zhfq2DdKI0CuLyS2VetQIusDHyvrTXYZkpcrWUXjGT9IDhfQCn2ukylKd
	 R7qUIoumVNzP8ZPps/V7WneI4bCpzBwzrHiMXoCKOgqvtEt/qbibLmSKWocI+M9rtSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=KF23iyWwR5yZnzbUCvNMaMixSGrIyVPB1oghCsOfI4k=;
	b=NozYwDskEbhzISgmuPWWx3JrGcT3O2WZwc4TwzgyrX1H0JdvLGuqE/vuzxwx7/ViiRqO
	 5Dzmvl/xhZWm87MYI0cDDpfzftmntaY3wBPiq6t1XmF1PDJy6WhjJmsPAQW1D1XW4645h
	 C0Pz+l4/YxzYqXsmCV5P+/fag3KE+EZn01N72TC670FpPfbu2jBAVHWTeivLCGRXBk+mM
	 dNjmvPFa/d0ulZKWU7sZStvP9+tVer6EP8rg82guZ/JMjbLYMYLjCWQDif2lEVKUVMQ1L
	 3NILJwJqcPRgUtEjr5yLTiw+5e/1FlTFjJ4qFHEP7VdvpLpwXHqhSr109s2mJIKu7ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui7qLXEe;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCC7606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 00:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCC7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui7qLXEe
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ccca948203aso2664778a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 16:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795393278; x=1795998078; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KF23iyWwR5yZnzbUCvNMaMixSGrIyVPB1oghCsOfI4k=;
        b=Ui7qLXEe5JZSNGGNnJt8YRoCIU9BozHUuGdwiGGRpRdbVOmZeySJsVDdurWv9z6VuZ
         VmOigNcxpt4gus56H5t3tfeT+jMthzm64QEJc2zAee84tuc3roRSTwD3Kv0m4dUfr0F+
         4ugqeQMPjbgSS4cdMlpNKVGn/lbd6gTEqFW9TDBlFLcgP5yn4h8g99RzjC8XXY/+LFBY
         IwZpe4ZfiOfxC/PDMkHtsl7/7xATK8AceJkZH0IS98SuaBuBBITDhuqsEsnfsOQEZ/PP
         u3myvmJEKPylm9aDUWQ7+IckA8eVXYDNm+iIKJa0jJHfttZyD/rjsrlkR7z95OGmKQPn
         RqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795393278; x=1795998078;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF23iyWwR5yZnzbUCvNMaMixSGrIyVPB1oghCsOfI4k=;
        b=FgQP4APtRZsvxkTYm7vSw5Dk59PPJhkk0XhAfxvc1jgpRTo9Jsnr3D+RUz0LAJkCU4
         y4ynlEY31El3MaXUIo6jteNxV+4otjjY7XBInN+9QZpcgayQRjQbpSDPyJJsz2FL6SWe
         g8OxMMjFcIuvop7Ln3UkZ84WaWYghDqUiySuhtawWv3DToh4NK4AOOKKwwmFcyQQxRqh
         UQkGT6OmjoGHQlOP1MuHWGY3ZLJAyEGK47jx3sCC/EP8yJazNJxrpLReHbNbttPDOCdn
         1zG8wfzEonqlNAU1C2YrJpGhY9BEQnb7D/i+M3tnX54uPT0FiI3m2bwXRTKYJW+R3Zcz
         z7dQ==
X-Forwarded-Encrypted: i=1; AL+hErE3n4VnoMjfGZvZOeJ1QJmg6dCrtGsImsLO8AwAqWH+M2emT+YY4BujpGKu3q9GPAH+zyrM/jqQkoFVANnQsmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+odhK8ctA/gtcpl0tnx3LuA5I19NXruKuhOF7sRiEc98hp8ENW
	SHUTd9FbP0blSaf5CsIcEz5j5fTRG2vbP1NMdz6LtM1Gr2SA6UZxGFSF
X-Gm-Gg: AZFdTZfPsjpGB2aw08TlTtZ+nilGUswff6zJjeid4hTGHz+mjqQyaF/zlnWxBkd0w6B
	4TzuKaZQfkpKJx6PefByoDe1axGPqPOaPiWXpfaK6Sp6cFEKqitlzyL/Z2+Bct2ceNpZNuISunO
	nAldYNzAlHj/kwztDCQ3e6krgZAAGyeu1uTD4BFUr1cmS6agGa029yHjUlxCkQVC9TV/FkxMXBk
	IXB2fN0uWckcJktQEm4rPQJx+v30rBvseMXWYQ7t5qjI44JHCumqVDORlKmCJKnWOGXY1d7GOR6
	rDFP5CHMN43llrZvrnVjLG+kMwKZAfdT+QaRcyZzH+npvxBxr/F6Yb8SNvWWNvMn9h1IMvYVjwI
	S03EKvnseZ0LSMOPApORSmQZXUmb5UpYQIX0VKBnW53WJQV5+54RPjaH7FTXbpbZnrefqzTFYAh
	LvOv3WwRQTpawva4K1O8UomLsJta8QzYR8W4SYGN45QLf9WliHYHs+ueqsnbmVsoiXhCl6QOX7+
	DVQEXhWvtxm5nkJ2hIv2i+qEDRxukJ6+K4hg6h/mKCIXJthgeAqtI6ISeoWKN/0Wjm4ZssNV/ch
	si65nfIYTeRkexsOxWJy0iuJqpTnXLoh1vE6yUE5DohkB35u1mjUblBytKhavNZPeR8EXjFWM5c
	5OAgoV0TgzIC9aTMNmBnvhRqQfV41LlSCTd8=
X-Received: by 2002:a17:90b:1801:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b41c8e16efmr9088622a91.11.1795393278264;
        Sun, 22 Nov 2026 16:21:18 -0800 (PST)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm4860403a91.3.2026.11.22.16.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:21:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 00:21:16 +0000
Message-Id: <DN25ST0D5K1J.1NI5236BF2BPY@gmail.com>
Cc: <bpf@vger.kernel.org>, <containers@lists.linux.dev>,
 <linux-api@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-security-module@vger.kernel.org>, "Aleksa Sarai"
 <aleksa@amutable.com>, "Alexander Mikhalitsyn" <alex@amutable.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Andy Lutomirski"
 <luto@amacapital.net>, "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner"
 <brauner@kernel.org>, "David Howells" <dhowells@redhat.com>, "Eric Biggers"
 <ebiggers@kernel.org>, "Giuseppe Scrivano" <giuseppe@scrivano.org>, "Hugh
 Dickins" <hughd@google.com>, "Jan Kara" <jack@suse.cz>, "Jeff Layton"
 <jlayton@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Josef Bacik"
 <josef@toxicpanda.com>, "Kees Cook" <kees@kernel.org>, "KP Singh"
 <kpsingh@kernel.org>, "Lennart Poettering" <lennart@poettering.net>, "Neal
 Gompa" <neal@gompa.dev>, "Oleg Nesterov" <oleg@redhat.com>, "Paul Moore"
 <paul@paul-moore.com>, "Pavel Tikhomirov" <ptikhomirov@virtuozzo.com>,
 "Serge Hallyn" <sergeh@kernel.org>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Zygmunt Krynicki"
 <zygmunt.krynicki@canonical.com>
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-fsdevel@vger.kernel.org>
In-Reply-To: <20261122193539.3334213-1-jarkko@kernel.org>
References: <20261122193539.3334213-1-jarkko@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 22, 2026 at 11:35 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> v6: https://lore.kernel.org/linux-fsdevel/20261122011809.2667684-1-jarkko@kernel.org/

v7 was sent 18 hours after v6. v6 got replies from the bots only.
v1 was +2559 lines. v7 is +5782.
All six findings of sashiko on v6 are still in v7.
None of the seven versions got a reply from the vfs or LSM maintainers.

The way you're spamming people you're only reducing chances of anything going in.

