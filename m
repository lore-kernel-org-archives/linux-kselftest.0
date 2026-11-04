Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833072;
	b=d99HBI3oHQ+bEsQF0xRRHrtzKhiF09oAx9odbRMYle1jPW7OpUXElO+kvMnmKtvQD/M8
	 QWpn1WKwokYU9V9PqeNhh0D/6e0Wd3DGSUMrRZmKFAN7/Yc4WhTkf9eJIxTHP5ztyuHRQ
	 KN3DtpLvJHT2/9sk0IGEmOapTIYRiDjvwHSbXFlf/H4InMjFzvPvEokqslBHRIkf4IdiU
	 kwqelSOd6LHX2i+nBeTKEVYHKZH8uBSja6LdTDEFcnqTflTPATSIzkJ40oqxXVK+6e5w9
	 5EE/W13EwlEZo41dv+40SnweQ2lQPUtKRcsCsc5E62ZbtbnZOF9CGugkvAeaE9v46qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bZmm/fjciQHFDsHygF6gqzElYGHv0HpumcgfM0NGUjo=;
	b=ypBfjyMUWybwOrXIbJ4EJbhqkV6Kntozt0+47gH5u6le2X5Bocv1AxDciTjshPk0tflw
	 tqTcYmE0HBsCUlKs3ycAPwF0ug3dB+QC7D9/7qvLlMLNQ8V7oG9OhPOuMjnd8vjrjLHYE
	 ntJ7A/Eetu7ZadG2WnuuoZGaDSu3P5zbtEgeqxXiQ2YFKD2x8rDZ3A7NCzUo8R4K7QsdD
	 AtRTcczsInX4rozXEoex9qrhZd8kqPKSkj6gLYMuwIACDv3Gf9ewTYknouMEjnl6tMKWa
	 WTWpxJHLAByK/LCRDRvJtzZFM0MJ/NFrxX0Px9n8v3iai07sptvcZW4W9Zoj8qyea9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDfTc7XW;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941F606A326
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 22:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E941F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDfTc7XW
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so11070965e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 14:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833070; x=1794437870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZmm/fjciQHFDsHygF6gqzElYGHv0HpumcgfM0NGUjo=;
        b=cDfTc7XW0ifae+8M1LuPWAwdIdNKakZkFWFnJt6KL55fGa37RQmqkq2uRmhEY7B1n3
         CaBTcgavNgfBak+NIwaNa3H5fTfJ9PIT5PgZQgH2MazyhDmo4aFllXX0SMasXGEEM9Fl
         p/51Tb9ZeDWq1NeJnxB9QMyf1cDUO3GXJQBRKRgploH8Le81bwbGb+y13nOzQrXCWpNq
         F42HKXSHEzc0A6bpTaknb/yOiq64kB0H1wCLiqtk4d1YdokCcUVaxOjocfuDaznMEOXl
         BFMxyeOdRQgLkukh4xswNJohIqsIMfXRyH1cjs8NbBnWvzJr4LA0LYjw3tAYWNzSjLvS
         MNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833070; x=1794437870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZmm/fjciQHFDsHygF6gqzElYGHv0HpumcgfM0NGUjo=;
        b=O19pevQ/NwKY5SW7+0OetfMuEe+79J4NEj7pFnb+36uXhpUJpgRhOyjorg4tXF82Ss
         s+/Xt1M56D3EQ6Q15vJtelpNz9SGRnp+iRnhIIoPIKnFIqrvBTCAHZoAmTI4Vb0Wu5ro
         L0HZlCBn/y0e4LvOs1YLUZzDP/hsaLOwyGsBUJv9xgAzoY/v2WC3ouiv222A50jMqINU
         bZ8xPyhAYJ+O0MMohm8/+cldoCWoeML4Z98hvZ7FHRQwZxEvrTvv9E0OhaEbf1nUFfHu
         3JVuNWKwH7Uavq43cYq5sy0+jRr+hWqslPFS+K6ji6tgJxJyCvSOoLqQALpnx0jQVFr9
         Y11A==
X-Forwarded-Encrypted: i=1; AKwUvBx1lZKWrElmZfHYiVOAdXyHVha7qNYbWCe+dhLvdG5FaS4p3LlSxtZEgg6aeuM21ivOJXqJqz11ILt128MiBPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y74a5ikLOOuHWeLOOpjrkOmCVjiCB+ME70bZhS4QpNJoDYPoy
	n4Rf7lJNWzuVW0pq7MwsjKPbgsqSjzrDYB5Bc+T1md4If/dWZGyViE+4
X-Gm-Gg: AYBFou3p7wYK2PGaRyqxzvZJFAaoL6HsJMdVrlPAOomyc/XSuQlj1qHLxq0jbnXRwdD
	DXWiV3uSVHGLkqw8s/TR0B6g/qDU2n+vaAWvfMLO/jFFLbu4i8oMTX51JvQHdMzl3Cabay5PHeF
	MlkEFXHjCy3c0z9b7ZGLEtHxeZQfayfhbdZ8MIZHZH+lUN9ARzbaaaqCQUj4NxtLvrrxPDZ1dK0
	/8IKz64r6yEMCbS8weaLQGuG+gMfr2WCjrRpin65OP+JfzABjTbPrIbuYI5Pg6azHFFooHnbNhS
	sCNQO1HfKLzOu/ROgoIVefwoXxcraVV0Y3ORg1vjDq2WMJAw+aVCcaAdqLbFopqlQzB8r3wb96G
	oT2oVJy3kNR9M8Kczb/e6LbgkRvyOcx3jJGw94MpDXDr0PJ/ckv7Pj6ZQjgMfSjiYOTjnSGNoPW
	AjWuZIqYk4NOqCNV16gthiJrLeJFG2q1CXe5OX8LVZ1PQvBIacReajjPtwOspCvya3IINX2qUlF
	RSrGbcDTj/oIGRWtxbNCgAPdySxJJKuewB6TGspsYwYS9DAtWoN3myHeutga6PYSwRmvjTKOxnd
	dOq0wzU5GDeiYqv7L0zBlCg=
X-Received: by 2002:a05:600c:6212:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b0a7aa0a54mr222825565e9.25.1793833070285;
        Wed, 04 Nov 2026 14:57:50 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725061e1sm17756545e9.7.2026.11.04.14.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:57:49 -0800 (PST)
Message-ID: <93d13781-0c37-4a3c-8fca-6f8108eff35a@gmail.com>
Date: Wed, 4 Nov 2026 23:57:47 +0100
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
Subject: Re: [PATCH v5 1/4] mm/rmap: duplicate a PMD mapping as one in
 folio_dup_file_rmap_pmd()
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
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 stable@vger.kernel.org
References: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-0-c56d0d26f970@virtuozzo.com>
 <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-1-c56d0d26f970@virtuozzo.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-1-c56d0d26f970@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 9:40 PM, Konstantin Khorenko wrote:
> folio_dup_file_rmap_pmd() passes PGTABLE_LEVEL_PTE to
> __folio_dup_file_rmap() for HPAGE_PMD_NR pages, so it adds HPAGE_PMD_NR
> PTE mappings to the folio instead of one PMD mapping.
> 
> The helper has no caller yet, the next patch adds the first one. Pass
> PGTABLE_LEVEL_PMD, as folio_try_dup_anon_rmap_pmd() does.
> 
> Fixes: d8ef5e311d7b ("mm/rmap: convert page_dup_file_rmap() to folio_dup_file_rmap_[pte|ptes|pmd]()")
> Cc: stable@vger.kernel.org
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
