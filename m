Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890471;
	b=XlMyJX7+gZm/OW1bjbQHvsVmuZe1zLks6kHIAdSugTVUrHfjqJXUS3lJdXnktnCtTMch
	 kI3ukNmdMpd9og4QJ9Rqg/w11QupEEeUsaxWHL6ApdSeEYh9vMNrRSjSn+JczGeDMhSXi
	 /PIB80VdvEjJB5xJypvjGNzjnGZ7mLp1PO+RilwyrgLkUQ6sA1BksH5I7AKVQHI9vyhrD
	 vMc2TzqedPW+hqjHXLSAr5PGIjkgKuVedSSEzQMiB56tClbmlKJ+RJXXLkOEhJlORd1MX
	 pVpDnzJbBUUmPQfC2C4+5TwZWoU68kR16Bv+Lwb3n89JmsSLjVxRSv5W9F8+DQtZwKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=B1BpSfpKomnAWXnneMgOIOUIIupPUlkHnrdwJoMfDG8=;
	b=yBpoM7jNb4X7UMEuClCGmngQcybx7GjJ0FLa3rgtCLSMJscpKsemgQlenNE1Cgza+wtR
	 9n7aeGqB/T4EQZZHZe7hH7jNmwZDjmVGsyGR7DAzEcfSdeSoGCRTR+uwdBAfH80l9R0kf
	 Hadw4dfPZkXImygOygJoZX5hcswknU1aS+i1wXwYgS3FsbkhacB7l7oSrPJoiiHWAXfqr
	 Jba7Z2qjHxDn2tgE1tSVfhMIGEziGDENORyr70EVL+z7Qxso8GskLliux162cRkGaiI/q
	 0l9b2QOEdKn3xt9p4PY+YowId7k2KIE3PaGTTqjXDH+k+eeV5aH8G4uWOo26DNrRb7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=RQVbPRDs;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A0606A6B3
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 213A0606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=RQVbPRDs
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4c685c751so79893707b3.1
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890470; x=1796495270; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1BpSfpKomnAWXnneMgOIOUIIupPUlkHnrdwJoMfDG8=;
        b=RQVbPRDsBt0MSWCiSmKeBaFExm1TPL1sC/9S6zPlFS/KqacMPzrZNim/E+PyvO76KE
         J3xmiR5DCOf5hfA799R2rg9So/b/GIS1Gtpw6Pe+IWI/1MiGuCtatpCD4SLSS4k7dp/r
         tUQLXMBwTKhYyfMupnqcB3KXm8kozmVeRUb8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890470; x=1796495270;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1BpSfpKomnAWXnneMgOIOUIIupPUlkHnrdwJoMfDG8=;
        b=cO4MqxTW3iQKrZ6AIKnJ9O4ePxFEz5IAao5c0VN26yULDtL0sbXaSAsQ3avQDn4F98
         N4z00NqhtJ13KdMiKhJzPc2Pek1Eq4ParKQ7HpfUtCvSDLib4i+kWlOihfuFLXNnX5zr
         vGPEQERruKpWQz2R9ew6Hs2OpjIpbLS+9JFDSiXXCDDj3e05Di6PxEDg9ytGks1ej3j7
         MvMKEehCjTv5TpV7Ob8rKhnQEezSBLRTX6pr1Z9/HOviBxQiJvtdvYG8a6IjblX/EvuF
         bidvUatIBRD3aom/kL0gKa/4SzDrfpSBERYY2L0hk15X7Oi+RSJcVnhOb+B/0w4PKMV+
         F7Yg==
X-Forwarded-Encrypted: i=1; AL+hErFf4Ntrjx8fdHb9tjQCuX2WG2T4KG2BDCLXE+ghrJGVG3sTxc/IVHyBhxCy+BBatsEVwsks8GKjq9LVnxX314g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A1e05WdrHAXJY1ye1E31saWjZG4deunKNax9QCVZ3WFq0eq3X
	vNDgIx0ya5oZPWJQsT4k+GZ4ACfNaOMvL9UCDl4w1M5dsOW/rcfc0vJpo9FEqp+viR0=
X-Gm-Gg: AZFdTZc1qsoSlwPgQPLMjlfYc26xUw2lQzA5cW0Pd4XmND0DSakVNdbEMh6RLgLdXCW
	GtesmmQxDGu85mx87H5ashR9uEWbZBCVHzo/buYXqYac2MUBWLQnMgoEFDXlpXZt5fyn1EtqOvW
	7o5MfKVaQxnOiHRWW9qXWR0hX2tVcRfJjRqSa2JNsPowYFQezt8nLXxCgPfjWOfFvufqbiIXrnU
	B1b+vvzR7sltnqF4CowEaBetPfdCuNjXJSvV15/Txung+eMRPJr5C9bdbanSzizqXPhJwT2Tn0E
	n7MAv8jnPnpv1NfxE0X57bMMUyfX9sRnWVG4OsA3dSmYp2eqr8cxBDSIeIMW8f7iVfYuw4d3aju
	U+f8z99yNkXuw8AomzfoaXmHxkC+DqK6GvpQlqvMb5sQ5/mlPGMXWbm/0frAHqVt1Xv8jx+EVYd
	m+xQimdnjsPJHmX+ktRv6S58yCqTfhRkgd9GXUBKpcqvYykrb7J803mVFP86QOaoNPfQ5r8UCnA
	PzJZk+YSQPuZ7i3zRwyKJ+/HrWKow711gdaFIR6zpsE8OSsq84xmttpsE3tDqn3ZFtCvotFbHdN
	0qdiSNHej7WAE3Mie44ByalkokxP3FBfqxIeZhBqQEJXLMrUoTLLp4ucCCh+gSo9EH+W7BBq6Yb
	AtAzP0no/AY7v0pwU7zhG732um+FDVYlvMHZ8An0D4qO8/l2Hgh3GQ2wvKLgL4h2g/NbUo0X/iX
	i8IDKDqcZzsbBQ5AEr7fFnKXe1Nm/Mq1Hk5og6l2z2fEntixX2rNtoHBuaEMdJL55A0ikqm8pV7
	pNT50KZGRPMd5fkKHt2g7U=
X-Received: by 2002:a05:690c:b99:b0:8b4:e258:454 with SMTP id 00721157ae682-8b520436ec5mr91808717b3.38.1795890470399;
        Sat, 28 Nov 2026 10:27:50 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d628sm106305077b3.8.2026.11.28.10.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:48 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:47 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
	Breno Leitao <leitao@debian.org>, Alexander Graf <graf@amazon.com>,
	Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after
	kexec
In-Reply-To: <DMZ9V6MU9XNZ.3J23SCKTSDHB@soleen.com>
References: <cover.1794383544.git.chris@chrisdown.name>
	<63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
	<DMZ9V6MU9XNZ.3J23SCKTSDHB@soleen.com>
Message-ID: <awsdI3VTudcIbihH@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pasha,

Pasha Tatashin writes:
>This re-ordering can be removed, now that we applied:
>https://lore.kernel.org/all/179508700586.361583.12491114908870226409.b4-ty@b4/

Oh thanks! That's great, I've removed the re-ordering then.

Best,

Chris
