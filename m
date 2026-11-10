Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329380;
	b=c/NVt3Ox078em7ElZlsMpiQgQkM+8Qe7VqakW4miUQEdNEoHTzrHUCTWZGWxGpii6l9B
	 p6g0cihBjT5KvDbPG9Zi5ZNOJuqR+sRUaqD7lZRgVfwF0Z8hXV0u//KxOBilcw/qCFeBY
	 Dm+5/2hnD7gkZlRQNbWCCgL7aHmMeTd0FIKGUsV35DZm84zf0/PpVYA4CDN8lNNMnZvm0
	 elfOIw9r5Us6/5J4V15iu7OpBhTcS5sIpjL278zsA3uWvmNS4MjHxYfXltJQhzwo1SM2Z
	 doZtGazmHHuiRzOgsPjBzN6ydtt/LGZ7hPtqTJ1GpGxrUjPeJke6Ed520Ia59BS6Jcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
	b=ExelhibJHfAg5+VnOOtLad1j4bDRMeYohG8NrN8ilpxmqrpvEKKIAzfDvmKnHXS3fRJr
	 xFmo/JRdDzcjP3VLMdUT0S+0DUKxbi/882aRtvNug+GDC0IDsoMo6mpI6Zyc1nYrqYiti
	 zqhPhCvnIYeOI5ausEvgY2n7exqhFsNHokfd80K4RovcF0QNpf+ogtd7Jq0zaj6fw/ftz
	 YIqSS95xrdmzPpZniXSEtxRTgzztAl8YjFtRckFEtWzF1ssCQdCWz5xWiXyNKSy3GIfbs
	 JOVivgpQ51tlrOT37e+j2IPE249uwUgxYIMDNNYoelxg5pYqXo/z2rAAKl27tBpBHtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd9gmcUC;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6AB606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd9gmcUC
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a19a2621dso1548813d50.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329379; x=1794934179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
        b=sd9gmcUC5EjvUfKx68rTBxuM9bdbaznz/tEwxEWenOWnU4qLBJS8XdmeO9Tqxwj+lw
         oW3msGNKD6Cc/5Hqirx1MWT8/n2v8Qjm9PUcuicql2WYq+rF8q44tafK9hFR2FUQ9pYp
         OvMf+F5cXA6oZ3QGRiy68Xwm+LHm3/qhIh+r4ya2txJhybsQZsYqO293qHl5BNjQg7xu
         kRJyWMJJrSkEmzH+uxkug5xGmR3DD1NLa4QS4lTBW9dhmtICsLwf/0BnRL47ootGLSEC
         AF1ORHoqamMIBedGpXGvtYQ5Rp3f+VaA19VjR2KGUb+z3qUm3l7PYU9mWCi/qlXOPrJL
         wMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329379; x=1794934179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
        b=2d3IIY11z1VialwYgQE2dWKsn0JRtIhq76G5Mc1qx6wy6GfsYgATgufp5iQM0L7FY9
         y3eCwi8Nl4ARnhUc6mTBo/q7dYLoE2xwnQgDDedS7yRGupOOjGi6JQSfhtEl8Si/W5oF
         DWfctaRosSzkGfy4py4xhJFqQkaiYtDuyUpBMyBs8Zse5dZPO2jOLemlG58QOxHmLgga
         hdbYOYpf0zIPmJVXylpL23lYE/N8vZuJLS4fyd9udEgUKD7WkTQBEPcKIphkmhZWvTUJ
         lHvjq92cuFkdKR8mBzuetO8Y5Cb9PpKWmf/1HuxkK635wXWStc0DJaEAjRKx9CA/w/3o
         XIRA==
X-Forwarded-Encrypted: i=1; AL+hErGoXXW4eH80A2/flbmYltGvhr27YgTRxHBLqi22a3J+7Q99b+0/vykWobYqFggIqzWCrSPhdrLib6G8QYd8yiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kKjysz21OUg4RDeSTFjUGuwRyeNdAssembX/HzXbeJmqCvwqV
	GBPGi2CUiBoWJYygCKwCLfQ/Y2MduM7FmxyGE2TajeCwSbvFxgX0JmE1
X-Gm-Gg: AYBFou1yzdvTsfyCWEvUPsL647ScIs/KpndjLaq3SpDm+tt3bUfGxx9Ex4Hb8RW0FrY
	LOyd+W5lwu2c9XuUGw+dF+deqVNIkEUIoFcgEgJXJF+Qt4s3ep/uo5oBejNBXiH9f1L30DceID0
	rIRqadl6FFrGZegrZKU6zqtQC3GW2dlQWEyzRR1OWhwQiF3woXpXSipVqgwJECreBQI0AHai1Ah
	5nRNET3Znb8PHof+RZK0sORuTjhFoFaa1JLj2ENHGgBUq0A6tsrarG0ReTi5UfrNjwmfTEys6fn
	7YnjP2YdjpBYUOJxHd7eL0hj9NrmMW64qSMXF/wdbU4c6ortpxweqvjTQS07892Wpv3hAnkqdXL
	Pgdbw15TeyYQSF7Gj+Gvyy3+7NpAmI3T4mxc/aG784odld6ug1rWLiYHyv6dlvMbcrYOPYXI9mr
	Yh4EaBOOwBGIDLgvpJQd4xRPmSOPMdcSUVMH15w3vooU7ZeiCiSAGxjEbiChRhE0NgrVFaNxSTE
	SIUjJi+ZUqEml1RUSHU6QFsRXo6FrquiLcj4gTHycWuCI9oV5tjr0fROn9F4pApGz0YLiLv8UBo
	/QzqRcmTVKEzztV971xIrU+ekqpIgzWMunVjyBRPIA08vIkV4bXA1ch2hQ==
X-Received: by 2002:a05:690e:12c3:b0:67c:fa4:2b9f with SMTP id 956f58d0204a3-67c566077bbmr2140240d50.15.1794329379380;
        Tue, 10 Nov 2026 08:49:39 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm2244105d50.6.2026.11.10.08.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:49:38 -0800 (PST)
Message-ID: <83246c2b-6663-4c52-95f0-50dac116570b@gmail.com>
Date: Tue, 10 Nov 2026 11:49:33 -0500
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 4/6] tls: update the RX key when a KeyUpdate
 is received
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-4-99b695f9eb4f@gmail.com>
 <179424471155.994134.17986033334400694237@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471155.994134.17986033334400694237@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> What happens when the KeyUpdate is not the first handshake message in the
> record?

Valid. A record with [NewSessionTicket][KeyUpdate] is legal (RFC 9846
section 5.1), and the check reads only the type of the first message.
Mainline has the same gap: tls_check_pending_rekey() does not set
key_update_pending for such a record either. With a registered RX
secret the result is worse, because the kernel owns the rekey and the
connection ends on the next record.

v7 will check every handshake message in the record. A KeyUpdate that
is the last message will be handled. A KeyUpdate followed by another
message will end the connection.

> The RFC does not forbid a KeyUpdate that ends a record with several
> messages, and the rule the code enforces is in section 5.1, not 4.7.3.

Agreed. The commit message in v7 will cite section 5.1 and describe
what the code does.

> Could the comment be reworded so that a future caller doesn't assume the
> old key still works after a failed rekey?

Yes. In v7, the kernel-doc will say that the key may be unusable after
an error, and that the caller must end the connection.

> Should Documentation/networking/tls.rst be updated to match this
> behaviour?

Yes. v7 will update the "TLS 1.3 Key Updates" section and the
statistics. TlsRxRekeyError will count every received KeyUpdate that
ends the connection, not only the rate limit.

pw-bot: cr
