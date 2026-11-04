Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793835525;
	b=02E5XuYczNXnlyC5r5k8fWR1M5uGVgiivxA8Rn0ktgLTEZ4hFQG9n9zqRTT/VZRC+Qak
	 SLbn7bNl9Hq/xMTVNXM1extlZlcqSufm3ERkqO2gSKbKX2jpCWbZVickhsfks8vrSmzHW
	 QgfWrW2I1GFd/qOXyVcBWeJgcHiSrHTvUsGBcA2kcgN09SyKFjrNNZlAlh3hSZijYF7Yf
	 cmZ4TVyH2KJOjb4r1C0yF4QkufJ0MzFK2olMpPs11wY6s88xTIJhxVy3Y44nLppCxpyIx
	 GHn0tru4vc9uzdgy/WFbzZlH2StWXpyUXWtXMKAXvC//f1+sQ+FzTP4Ua/fwbQJyJVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
	b=m6dfBxbqi6vBIRys1U7rxXe0itV9Gb0dSPgrKX6P3xx++ztsExr48GvURCQIFXx1UR0P
	 qskT7qimbj9qQ1s9FezcO1qo6yzxCzVqljvA5gQrU7Q6BUuSfrOrNKrxrknriIExqzEhq
	 wB4jF4sLBXSmBopoNYJm4E797WKPnRFpCzo1sMO5kVhv8v2wYvY5k7rxMh5VjF23l3+6d
	 imhFuNFBjpRFWy0+lshjts5hImbnwXaz0W9lENUJ9zgDg+WBkaFBNth1k/R9fIg3Sg4h6
	 o/hWv5Nu4BTEb5OCSJCbVQZzl3NBfbzCPjYGMnsD3OcE7jFrcTgOEMnIYarpZY5SzNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gNlLfk8T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38647606A329
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 23:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38647606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gNlLfk8T
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso230933166b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 15:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793835524; cv=none;
        d=google.com; s=arc-20260327;
        b=FpxI9XAgDyck2k8j+kQ5q0NwivBpe37IfcyQQ9laDzbfnyxVve2tWD27f/FaeKFE+E
         B40js+/5/5d8u9epiS7z1DTuWC6nlcLfMyPFaAfqAgNcgzknrBSdUH7em4b1pm/eRwQq
         SHekOetSknSGZw3L7nv8KcJ1bgqhJ/MxMCIK7c8pcwZvLdBSJXMEPCpyBnmRMMeu48W5
         wrq9opHGaNd4XIOXp3i57P+k9VOj/qGioPYCytKMs9Ur2CiK5spz0gjF6U2z/wKdHWGM
         i3DZs5aoPo+OfOpl8roY/7AaHxrrPBHAHp0JC7JJ5Etbxjvy+oqrbk2HMdmnbPaArONZ
         F6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
        fh=CI4eSTCUkgBeJwg+6Su1hHz1whpRfePn+ArqfIeXdsg=;
        b=pk9zGDkEab+SXIMwQRF4lTYoxDDTjaIm9mGttKHkfZZje7B0thiIOvdDPBRVUwZ+cQ
         ubTS0dYBm4zseY71VVxZ0pWiMaR6ipRj/9aJkKY2vfKvF99kspQVGpMOghp9Xqy4qKt+
         l7mp0Qc2bcE2+jUyxZUk2AQ5S4CKNdEXYZv4GWKU9STOCLykpCQR+o27WWuetMav2Cox
         HQePbXGhcxA823NIsGoElxJ+yBgXKsHwlla+Ctfa1YTePFxq8K3COKMFDqrACXqpiXKJ
         E/xz93KPDt2mNa3/bC5c6gQuwSMhfDbo/uQ1qPQqcfEtzyTZt/PtEDP0anDFnIL+BaeL
         2ahQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793835524; x=1794440324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
        b=gNlLfk8TxTdvYNSXblBhO8fGwqu9L0YV2NFYiD4tuiPUC6D7vFpjFnh5QScUABjTHX
         atIaIH/69G8yjfA8jiXvexcY3KhUcsiXvYsFakRampFlVEs4jE7HUZiSJmuqTuluCixV
         hhnh+2KuMroztd4vzo+b41DxWlAuZD6CLo8m2Fl1ttfpNVFpndNvsWxJRaQrvk8GbkAb
         wGxFhGv3oex7clDbptKUybCWhgGx5YxkvYQSBHIjXt3V4p/i2xBq520p7IrmmR2S+xrS
         DzVoZrK6kn4dZLBYvygPwaXUCg9HuvI9SiWPWkvPCm4jgMwBLk/3O0hwtgGfGvYaWh1P
         No0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835524; x=1794440324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoCFEISjEe+3bsOKsg9RxmedHt8FzEUYGSYFsiV26+U=;
        b=RfXMe2N9sR0RYW6vt7e8xQTjXa3TcAtYH4fkeI9ibbWTgLaWmnaaq1hyG83ZLLCHRa
         V1/a/gbWp+9i0xUhDXjIMgPFay3LQHFyGsLbZLzzNBnKlFnf+jtjYj6ZoNDlKOGaQiyT
         ggVwgLwfXEutUb3SCo/7IQC9WbZ5BBfV7LJyR0EKDE08+OcDxrdIOz+Ur08vhZ98j5p6
         A1DpGPlf7ohbl/7nM4iQ8voaaZPrmQprS2peyqH0sDMPuVw6OrqdM628ABqY37fhNF6V
         p70Eke2taUiYeEzUtxpD5/erSXoxc1FglnbsuXRUhfZA7VTw04Qv7wVsbNV/bQilr4aw
         1HaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuBOtXbcBeloO5B5XT/GNEFNvoTmRwFyp3V7CU+lF5dtGgd8AU9MHNADsevM+J1vxwz5i/9WlJ9ERQKFyVpAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Udw7cKHep2XLiXWb08waA89uLJGXHuucC/PF64QxZLFHwZEM1
	IKfSO22wb1BemXyW5GPDCJiz33q6B+7SRqMkRH31+ATRvfoJXIlj31hssbBrzeVOWR2z7HFAK9u
	jtdobRV+yBaJIL2yAKpLt+nMWnZlP+4sjGJKosatM
X-Gm-Gg: AYBFou3xBnxxEB5owxyTV3Tw0a+tN3BCOU5dALrJQPWZEzcRAKPJ4EbrrsJvFnEQ0tG
	Z/au63C12d5tglKlmMuQaE/UhCIZ+LruIzSR+d6tKrvVBDSjO0319WngcRQb0BeJI/Ra4tjOuDD
	YdxoFFrSVpossUtFiANzUvBjFIhiNpZe1pkk+TAhO9dgDG9F/6rKh7/31SB0P8S40qyBbbxPevU
	JC1TAW2A7Fdd0pjrzsdZrZW6skMMPkkFl/xwy4mpNYUtM3V4G0BOqvsMHrAVpE3aOiGYAxq78N6
	UULCuZfNOwoaChhZil5KInrsb54rJfIhJN/XH8HPD1759XQjCwmW/OqBurxAF7vU8vzsKayjpz7
	n6K+jjGxefwQ3ygvoHH+XFte9bJaYh3RCFsTezw==
X-Received: by 2002:a17:907:9615:b0:c2e:893:7010 with SMTP id
 a640c23a62f3a-c4ca7ab1105mr1606291066b.37.1793835523294; Wed, 04 Nov 2026
 15:38:43 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103010216.3447716-1-dmatlack@google.com> <20261103010216.3447716-9-dmatlack@google.com>
 <2vxza4nok0ji.fsf@kernel.org>
In-Reply-To: <2vxza4nok0ji.fsf@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Wed, 4 Nov 2026 15:38:16 -0800
X-Gm-Features: AclHuK8g0SSTWzLAJK32VMTa5tPkJ4SYKSZ2JyPLhAu2cuQYk5IO7KP3qYgSUkY
Message-ID: <CALzav=cjq0FjSRe_KHns4sGpHtspVy-5DBdo6Kzg1TdQa1z9FQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] mm/shmem_luo: Allow preserving tmpfs files that
 are still linked
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:46=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
> I usually spawn a subagent with clean context and a high level descriptio=
n
> of the goal to review the changes and changelogs, to clean up these
> things, and then of course review everything manually.

This is a very good suggestion. I'll do this for all my patches in the
future. Thanks!
