Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455524;
	b=ZM+myI7q2Ljt8IVt6X+da6U53HTC90/TAhIQfjVeozFhqrkctxJZfx8zXjVB09XwHt2i
	 BAv3VGNeuCnn5z4OS7hJGbYVWoFGD+oLCvu5FDQPN7Xca9XDWdX3vP6I2dzcQpdsLVKqf
	 pK6dAEKMpZVge9KEzP8GCpbk946tDHoF2mQYOj7ytIwxezSRhlNqyGcQUO3MKSpqmmVOf
	 T78jJcHk+MqL+sEEHOdzESmdL2vNKE/uz6gyWcXMhg/cbiYUgo9t0MMsuLD4ZRXObWpsL
	 x5zYsUkvGFK2B1hcY+TKKe7zS6CU/lavji4pF2yKtgPHQVKgr19v1DuxTRp2zXodGkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=ON4hm5xX/TESJ2KwEmSXnqTeTKDgHlHTMudm7RJl7Pg=;
	b=JeA3a0HO78wBpFrtBIbzlDx+lbLSjR5lnu1tbw/IF1C/eQ6sOH3NnC88FoMHMjmZ11Np
	 gV23ldFJFRnxgi8qp5LL9+OuxbgQZDntAZ7OR7+Dco58QjVn0p1sr4lWWbCoHbko6APDQ
	 2VI5AFSAbQKWJdEHQODV/e6Hl+u37x3kfHmunHR8amnZxQSq12RNa3IvayzST23JQIGsq
	 BdPw/L63IgDRpsNXAyx4wuXmQQ/0DRrNwzLmGYOgwQt36UGDcvnTTFWvd/CgDVUiPH1ip
	 4stt7wXPb2OGeGH3jvBJi6OBpzs6xomyKToi10aGT4ZcXhO2mk+IrHvFa60egWFJjVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O3/3Z4Rp";
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5C5606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 17:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3/3Z4Rp
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3862cc30b3aso838957eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 09:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455523; x=1796060323; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ON4hm5xX/TESJ2KwEmSXnqTeTKDgHlHTMudm7RJl7Pg=;
        b=O3/3Z4Rpdei0zf2ssZjF8HctgbmIYu+0xB+R4Xqy7bfrD4NtDWhP2KX1SRyqltULNS
         SG+/1MorElxDVxNciiim/ZqvgRNZTaVqTcWKb2gqLSUcq2AJQhq/acgDOSSHPDFMbWMA
         O1Imv3q+fywKqH9GotJcqflI6ww5n/91ofTcDw0qeutvG3T+IhyC2+SVjoJ6tSxiXyMz
         XsX5ngXLGr31AMO+w1Ck5yjV17mm9wHXRZeo/OSPmNisxtpLUcbWo5tgpGoULVRraTZA
         UTxJa8j1IBb2RamgNO1t149HhHaZAhYTGvPZhzmXTs8aR7VqBCC6JzqoZkwaMYh82svG
         CxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455523; x=1796060323;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON4hm5xX/TESJ2KwEmSXnqTeTKDgHlHTMudm7RJl7Pg=;
        b=qf5HwtLZwdH3CQBt0c9ifrbg7lwuZPc9zFaQ9iRP15dPu5XlDI4bwcVdd1PcIp6tds
         E5GdGyguK9/BLt+s7Y9ThGi9+M30rzQXaGppcNTi7zZYkIVcR6qzmpQKYR63knZsts/G
         aWpfCV2kI0C3Ty6VHvTvCFS+2ibtGc8zjFooG2w9ZK5thlMDtj7NUgFb4Cqe9Y3WTSFC
         QCaOuC0AzGUXlfgbM9TC7hVdTuSHKM5r5h+z9kxoBGRLjs6YhTe7I+n64DmHle2jVp6s
         v/VsgKwcQN1iwXXXLw0lRJU1rs9puFNk98QwtVKQJgO7vQj9oYD5LUniN31qRk4xfSxA
         4wqg==
X-Forwarded-Encrypted: i=1; AL+hErGGKFrk+z9SFHU/+AGx0HucFgvZTybTVUEroO5FlrJNpOOoAVqtELQ4LSFjQcsJXee+x+o/kK81yc18+B8bmK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z85rQtfKabmFI6TPlDFvhlLrP73Tai+8fVXN6alE14w2pzilCrx
	ahzmi69TFeTmUjK2YmtUihwVgO7/GvXHfqfc6N5QDR4Zrvw9vN8VRy7I
X-Gm-Gg: AZFdTZffeZRLnDvLItuRQVlh9ZRJQIUqx8Wbp3q5/S8eI23KyhV6M6tKOunMi9tR6Z8
	GewPCh5KsJUhr0f2GDT7yJj7YVs0fhxDuF3bfG8gPiUwYUblx/PTMvyDjOasV7vwfzfN82cDA1V
	mqcimmoQ74RGENsQlp8arckbOZ1dYYFOcxtcJY9+9tpjGJ6X4rzuum8T72an+wYSIq6gZSn1Gwg
	n0VQVU7SiREC5fkcmr8SAsAtXX45O2scZS5BEP3Gl5PtwdNFvjeM2xw7GERDr4pzNVbMC0FoeYB
	b0o0x7q2U9uqzprGdXtH7kRFFv+x71RFG1scrurbADVqUYzkXOJepz0Jep60abr3/jUwdhy68UA
	JqAZ7/X2IRfXmoL49JizR1sMHZM5vgP9c5JkxtwoyjJchFClURTLf6xRH/zAdWp8JHAViSjSqqe
	oXAGcCqk6VU+T1R1hf1n/zeoXeRehg6zsXEnVGj3Cn/6XLR5bi2nsl0oMKRe5CDu/BCQ0pe994p
	/TG6Lhc5w78VO7M4Bu+qThVljcNe1L3Ru4csLLyswaG2MzRs4rrv9zFdYq6d0QZ2Xc5NsWzQYes
	bHCvLFx1k1wsb+Q8TWjjg0zxKOrPy50Xn6iH9qDeFKve7tb83V898Ff/FEjFOo3c524kKxjKIDu
	/GYIZpD9FFkbOM5+bkI5piM1P+G3ijlyJW+Q5FBZen3oJM9J0LzHAI+lScvDyjQ==
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr13093027eec.33.1795455522859;
        Mon, 23 Nov 2026 09:38:42 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm31532302eec.25.2026.11.23.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:38:42 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 24/27] selftests/damon/sysfs.sh: add basic tests for
 admin/reports/
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 24 Nov 2026 03:49:25 +1100
Message-Id: <179545256510.4.17741169185712698444.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 Lian Wang <lianux.mm@gmail.com>, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Shuah Khan <shuah@kernel.org>
In-Reply-To: <20261121210013.130397-25-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org>
 <20261121210013.130397-25-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sat, 21 Nov 2026 13:00:08 -0800 SJ Park wrote:

> Update sysfs.sh DAMON selftest to cover basic file operations for the
> sysfs files under the admin/reports/ directory.

LGTM, thanks.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
