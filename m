Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289FC306771
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592794; cv=none; b=UYKf5Hz26+Qk/IhjEtvclttTRBhw4zh31Up2Yi2/j/gfRlxuk3NniDX32/J1+jxL5EHpkbQSvQIlDsw3FUUQD2GilpfDATK2qwRjUoBGlMxJG71EQsUrItihhWO4NnWjRDLRbFK6SoIXh1OP6KaUCri8qaBrvHcpCYRb10usslo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592794; c=relaxed/simple;
	bh=ulTqOnJ0/DOZtfwfiFl6Nx8CEJn66OQ5TqF7AqphWHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRpv3t9iZH8vU212ed9sLOOX4mplBIHE816t/WhhB9twr0Bwurg6jbUcdOaxHjpod/PUyMHcQxMPcmgZQGxpOBDWKYuQw5Mq8Otucn6NYw/BdBFguwjj51RLlMVYlV/9z/UZxBayIaQ3/3irE8/bsqXGWVeBP0aYipxfRjKC/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ULmquoS7; arc=none smtp.client-ip=74.125.224.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ULmquoS7"
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-65c83b7e2deso591288d50.2
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 06:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592792; x=1779197592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M43xE3rgAlqZemGJ9rIPU9yoPZP2zJ9KSuP357iBUFo=;
        b=C23IO0igVN8tnQX98mjvvooe9VGZn7zzcuUwDcb2+Vc0ir9YFW69RIrWt6RxA5ZvbI
         opUlIJtvgbUuXMrs7j+Ulw43WjaBVOOM2wTCHH5ziCDe/+4WLwqL8nr1J9bGEvxYsDyy
         RTu1X8q+5SAVsfrojcQgRQxmdieqFci2o6v/uJ6rUqYjWh1Ho3jyZ5XnQTPKGtyBmu7Z
         0ZbnW9sqGbKVf6P6wVmy9f+p/p9wcJ+se1ybjxU6lnNYBvhG9tFTOx8WC6hO4QpRpNh5
         S7oP8GtYkwhj10ysf0rj9TBJlAFqqWsrrVG4AJgBcYNOek9lVaulk4KL9e4OHJN7MlhP
         Kyfw==
X-Forwarded-Encrypted: i=1; AFNElJ8jQJ7gtINmeryAOcTbI6PYNe8TbhQG6PlfK/bBG1So/fYDeqb7i6MQEeTkEAErqLyxBno6jgdLOb6QWV2OV4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvUrpXK/2WLn6pTHkcMCkSVWS2f+uuQ3VAIaMylwsF+n6COql
	rtPPSRZyQXuBydP4ZOTPiNVqQGy+cdGnLBO/dTw4KGALPhlA30zJXZdFFJAaM2tsoiuHYmWBCIJ
	1m0+7CcqPPYMwq1EXPoDG/GHqqUw5nCs80tOMpIqvTCUo4sLzh4iaBGbxZ1tdmMAR/M5mfMC7tt
	cHkC+DERNIhtzTBn5S58d7ApYaOcuBpp2bh2getzBs98l6BFvfgkB4CdpNGfHQ2OvkcDOn1iswz
	fUlR9zpgDpUlBjR5g6NFwf1E+o=
X-Gm-Gg: Acq92OHTF75lSORcgu8kvVOEBhi18blLBH1AF/yKSHTONPOBsXeOTnFX3kvo5yX5oUm
	Gn1Gw4nQbfuze5TXUOVBXVqBH5FALfJkbLuP80Rc23vZEthHYip3kNQJXKQnP24fKl2jHMSJacF
	NRLWHL5LZVqetDyvF5BBmrSLZD0C+b0Un/81DhhdQAFORReMu5fDtfDDDdv5gjGuzLguGt0MdJt
	UE/5tPC1A+rP6XHbW10RNRgsFk96Zx6VQnJ7HlOsTuuMJM8P6N30yBBzIva9akz81vp3wBjkbQx
	ukHUNRmY0hMa3KQL4S+Zf6DkqiUmzYUWm6AQN3Cftshjco2pXkxupyK4mtczDNTa/DQ7yqHzqky
	ymix80XbHXGbBduH7iTsvuRP2d3Xbs1uQkP+90faMjdz1M3zCYHgEBihupPiXCkl4iYbu7RXShB
	Y0+OzuHg==
X-Received: by 2002:a05:690e:11ce:b0:649:ad8f:913d with SMTP id 956f58d0204a3-65c7b75eaa6mr17511446d50.1.1778592792095;
        Tue, 12 May 2026 06:33:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65d96a2a2b2sm1064972d50.10.2026.05.12.06.33.11
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2026 06:33:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f5feb31bc6so687498eec.2
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778592791; x=1779197591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M43xE3rgAlqZemGJ9rIPU9yoPZP2zJ9KSuP357iBUFo=;
        b=ULmquoS7rMWPZo7vHyWDcNZRYD6tgjyATBRSU3TiwbHvRA573Lxg+q4jHumSdNVBpT
         OpnjT335zJFR9C2oT7GMjt7NB6sqprnqLPNN0jxaty3b9uOhxur7eJVtsFGIBU4vzWEr
         jamorsAEgJN7CG6oT5/LCMEaB9XSrne4tDvBg=
X-Forwarded-Encrypted: i=1; AFNElJ+wrIPhQBvowQrDR4dn1P/7wQnsThus7fJqgJS5YZ1NrETadsiVrOhPMSE7i62RiqVnBbTcqygTCq1HIBgiTZ8=@vger.kernel.org
X-Received: by 2002:a05:7022:6992:b0:119:e56b:c3f3 with SMTP id a92af1059eb24-13203e9654emr5811837c88.3.1778592790438;
        Tue, 12 May 2026 06:33:10 -0700 (PDT)
X-Received: by 2002:a05:7022:6992:b0:119:e56b:c3f3 with SMTP id a92af1059eb24-13203e9654emr5811823c88.3.1778592789838;
        Tue, 12 May 2026 06:33:09 -0700 (PDT)
Received: from photon-d7fac424c0d3 ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm22957383c88.4.2026.05.12.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:33:09 -0700 (PDT)
From: Ankit Jain <ankit-aj.jain@broadcom.com>
To: edumazet@google.com
Cc: netdev@vger.kernel.org,
	kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	ncardwell@google.com,
	kuniyu@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	karen.badiryan@broadcom.com,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com
Subject: Re: [PATCH net v3 1/2] tcp: protect locked SO_RCVBUF from Silly Window Syndrome
Date: Tue, 12 May 2026 13:28:12 +0000
Message-ID: <20260512132812.25147-1-ankit-aj.jain@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CANn89iKs3KLo=5hhUEH8OEG8p7_52g+fsrwYYNW=GzP+k7WW-Q@mail.gmail.com>
References: <CANn89iKs3KLo=5hhUEH8OEG8p7_52g+fsrwYYNW=GzP+k7WW-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi Eric,

Thanks for the detailed review and explanation.

> Applications using SO_RCVBUF with tiny values can not expect kernel
> behavior to be stable,
> since rcvbuf management depends on metadata size, which can vary
> between kernels versions/options.

I agree with your reasoning. Applications locking SO_RCVBUF to small
values appear to be the primary trigger here, disabling auto-tuning
against modern metadata overhead.

> If  a kernel change is needed, I would rather enforce a sane sk_rcvbuf
> floor when the MSS is learnt
> at accept()/connect() time.
>
> ( TCP_SKB_MIN_TRUESIZE / SOCK_MIN_RCVBUF definitions )

Enforcing a safe sk_rcvbuf floor based on the learned MSS and
TCP_SKB_MIN_TRUESIZE at connect()/accept() time is a much cleaner
and safer solution to protect such applications from SWS stalls.

I will implement this approach in v4 and update the packetdrill test.

Thanks,
Ankit
