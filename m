Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834142;
	b=JhkhIuIeFaHNbO+FhBwKxeNyIKCX5BypoOZqt1URK1/RIfmxS3dsVYq9ufW/YPmbGMxM
	 cRznF8pxXBj2lpyWsGGY0/0o1ZJjemr+dO5DpX0WxzIMaV6ZnF195xsWSbpTDWxDmbIzn
	 swk98zJ0NiyQL0UG+BRAbWHD+gt7HqQbJJUV6uxhDZcKFeNq5sdL98SKt2NN85YC9bnrw
	 FUaY2Sa0UMAdfAn/hFHzVnb8ufiSwu3GjkkMbjNvNmTVMtpH73cWa5m/Y0MlZ5NGs2V1m
	 4jvRonIEBTpeMVGBhNiaRrko8oMtiz/BAvVEOzQoPSy7aTeuBASTt/w4oaXNuSaniqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jw1A1CrCQXufCGBVmtCdk6Ioy3GBOtyXllOzk3wnD2c=;
	b=Xgt1ZGrx937hZf/DBdBl3OvkdcswoV58sD4cAdb5HIKqVSB7zWvvk5UMrLTu1G9HPERC
	 wzuLgecFlg06jYlTh4s5+p0W0l9eGL/zNVIvKERbKcg2Xe3WMh3veDasswxVchxLSSQBe
	 ckI43I3V2n2gSoVJqNHaMkHYcT7CWcdOvrD5AswdrqZQsUD8Q7LFIIQZgQTuOf2d99z+R
	 gJ5Ovy3D3VgA+hAkY28VYdeeu4SeblauEghDV/ODqHl9iR3TxXJFVq5uL6TJVqudAvJGv
	 Am2lfvFF0HjYnklUm1gZK4Z4+IJspDh7Kvs4qXkNt+SbSeZAKGx3fgk/gtIOEfSg/uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD1A606A329
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 23:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD1A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so11243725e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 15:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793834140; x=1794438940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jw1A1CrCQXufCGBVmtCdk6Ioy3GBOtyXllOzk3wnD2c=;
        b=axhdwTpYq+UaGXjhC77ce+Tg4LB7x8gBDFrWSoDcxdhuvO5tPQtPCtz9GvNylrSkux
         innhVqS5u+behTS/qXCGj9Ags0kOlTEczMI0WuGXOqk5wPX3IolkzZFfnYe90FxxR/lg
         iiWkFcVh1EaSwZX4TlasKlhH8+oF1+CbMSlrD8GiJA/x8Qxjpw9u45Y2Zcrab+LjpwOj
         aYMJCRLY3srOmcAWyeVa3xU5OJs5Vjp2TCDu9zXA6yGWbRUUnmZ+Iw3OeniD/DPGwpxb
         PLf2pLJIpnvrQd/sULK1CxhhBb7FigAFvgflcaZDFQ89Ti+/EqMK/zk0qPMEaC9HiBRm
         hpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834140; x=1794438940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jw1A1CrCQXufCGBVmtCdk6Ioy3GBOtyXllOzk3wnD2c=;
        b=QcEcrVggvp1G+Ib+TMO09STPFXX2EzSb3vMRfOzCtbNJp01rA4JKkSpNU+cmPW0/Sa
         r0Mk2bYGSy+HArlQkmUfsuXJoD3Loci5fF6bLbO2HgcAgYnY/IFvhE8dUhaj4c+3oLa9
         paMdl6ikHB4jjRIcm2jJGeiJ0sMnTOEdAxd9BBdmmt+86XK2XTjJrq5bzb6uagkdcx/K
         0nGYpF5ekRMOcWpNkm2XUUCS55/04e6pyhKOtdxmongBL2F9yWXyI5SllmuuSuASPM9N
         d1ek4EZsJjc1ZMbXb7RYX0jLQyLPlLxsWI0syHFgu3nYc52XdOl4iUCG48FsHlg/Hm8j
         P9HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzh+pm0S3ouTNlVvg17MFQyuyJQ7Ud7WNLMwDF1kYY8kI+ciQEytgCnKOeAiHd21BhJX9N8S52FXoKf5Z3YmeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kUqeCYbyUpxkLivQ9ykp+0zLrM4iFwxVYBEFR4JapwH5jxAeF
	pB7ZalX+WuC891kkZJ5snfXnWCAEBtMy0pWxEPj2gYxZKNftRU/bRhp1
X-Gm-Gg: AYBFou0cJuJfRwckVIXg99/qxpBrFEw6sDUkWyRLUKuDj2GN7FGYGyBFzG0T8Az22ep
	5QZ+TpRCCaiJi2bfWLy5IkVE55wx4fVdE+OvH73qWEs/i5rg55iy/8/UEkBu43CiCTkdY285WFP
	AJKFJEUWdbQqQr6JzzmE+nR4RIDP3QQ9v1cJRkIplm2FIb0QLRPyTQ8RJcTjIZI1wGqU8WkKkRx
	h0EIi5EKfWH3UfHfMktS0iAQNQm6uXcNpqm06hGS2LBod0XkTRtmLMz+yIB+IQj2CUgywfEAB/t
	kfpE8XpC/HNGQVCnOBjlEtxj8OHKo9tcWYnRYC0acnU1l1iTv9MzXXltPquOO3wwwz8ojWfTdPt
	0psFGxiZppsb7JVzhetHaYvzqokIGnd5pMJQc155HYLRnxF4abWPaKaw26WdARCnfWiSAYkdPzP
	8C592lEspBuL+HUWSxQSoT4CwkNMGwLX7cLQkMhmKzacP6U7+amaRys6oM8t25hJIF/HlRPf10H
	/WuYthuJy5YqIIzUB9eN4XsloGCtLzOFoxP4Lvty2R2K8UGE8i8RVcrlavREwpzmk4Jx2dclIsN
	N3v+TqRio4QPplcj0FllkIU=
X-Received: by 2002:a05:600c:3f0a:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4b3c3545341mr83410955e9.20.1793834140542;
        Wed, 04 Nov 2026 15:15:40 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20567sm6769827f8f.51.2026.11.04.15.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:15:40 -0800 (PST)
Message-ID: <ad6e93c7-203e-470f-804b-fbf7ac9890f2@gmail.com>
Date: Thu, 5 Nov 2026 00:15:38 +0100
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
Subject: Re: [PATCH v5 4/4] selftests/mm: test fork of PMD-mapped shmem THPs
To: Konstantin Khorenko <khorenko@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Peter Xu <peterx@redhat.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
References: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-0-c56d0d26f970@virtuozzo.com>
 <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-4-c56d0d26f970@virtuozzo.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-4-c56d0d26f970@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 9:40 PM, Konstantin Khorenko wrote:
> +	pmdsize = read_pmd_pagesize();

read_pmd_pagesize() is pmd_psize() in mm-new since 5d123bb07b18
("kselftest: mm: rename read_pmd_pagesize() to pmd_psize()"), so this
won't build there, will it?

-- 
cheers,
jose a. p-a
