Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897431;
	b=QEekpT4lzVGDvOLiO4+u7nHqVOyh1i3XAEg2iZ1RjZ2rpjwtWm4TH0jyjMx+Lhmz20yo
	 BqRmxEKKwoh8fhT1ixccxe2k+IqIG+Xi6Z2a/jC6pLErd4r0o6rf995zcGEU8Y8VtaXsH
	 HYjAhQJQ3TxGg9wbn020pXWJDMmNIIv4rbvlzD7KbKaAXXkWK0xvXz7zOAhC4ImQN5oGK
	 QeKOhnBimukqZKs28Lz8L6oELcpm203ZqYfT/Bqo9+2nBU5QPy9DBu0AuuX6QjE1dSZle
	 T9b9z4yBHqU2nkAr8FYqS+x0D6WJg9Ipk1HkQZ6fI0t4fdT63+QTBjElHxQAlTIgYmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DOsBTsM8HzI17SPUr1ak/9a9bMUvOh6RzD9t7xsTYQU=;
	b=5PJ5tIzPYlsrCQd7upkrZIntKO6bwezoiT4CBSkHymrEcNqEeQS7/gBsDcxkHeAOukHm
	 tB8qkzcfwc+AB3gDNdig9tin3FTdNSze/mNtLMhvFop4YjzHRe0v8UNIZBxoYxc8jhRb3
	 KRm6LCjQS6A7tpmWB34KAo/O49RWySimH8d1gbSEG7rQNM8BHX4giWWLc8CX7tz0l2JMn
	 8I/pyUseqmGrGpodwLnF5u9SYBsSX9a69KQDKlHCQQVgOmUTeHX7VgmAmYjOrHboXtWFB
	 qttknw/myHPDW7e1/FOlmFfPV78Yjc1QFOTzDK8hm49aFqB5h2Xg6oHqsByBB2vs/jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=MauZHBO0;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=NAacnamq;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5532606A323
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 06:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5532606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=MauZHBO0;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=NAacnamq
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6GXml2130693
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 01:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=DOsB
	TsM8HzI17SPUr1ak/9a9bMUvOh6RzD9t7xsTYQU=; b=MauZHBO0QHOwDKA+XX+b
	5NPgYZ4th7Jzs/pn2qwSByCnGvBsaSJc5coSVdGgWEdboi7jundzHOOM5HiM42WB
	w0OyBmo17RGT7CtiNHkic9OwrbhIuAIOKMz1xyVIP0oacCdQoPCmhkkn2AmamZC7
	mBeSrbxoXB6igxp5uzLLa4D2IFme7QvqvquEjuxdUxnBQA6/IHFDWpw05cjVR1nA
	6pqKykASzKK8FkuSYbOtbsrqtnG1wjANodQW1tQeKxZrnFbvlYJ/Evk7urX0feCD
	FDfewHX0Jj2Ys1Zg/kZOA96usAUZAlS01YBpxaYovi/Ep2sJWUyQKe5egD9ZDAKN
	/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059qwgck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 01:37:08 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso655074385a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 22:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794897428; x=1795502228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOsBTsM8HzI17SPUr1ak/9a9bMUvOh6RzD9t7xsTYQU=;
        b=NAacnamqM/fJxKIaGIq/+aJuJkRwcvSvNe3PsFCVhJHtQPEw3GkpqTnt/Zu7OcjRdT
         UYcULCikl0UsUFK7F/oizAEr6LQbCZxFxLsrE3/+DL+AZabmY1fPMMPxnaXOARdgk/kS
         7FtXohksQSwnIhBJD5Q8vUjq+2XaUxgZRXz6ABlYlAtyOqPqJ+qXEiV/mxrLFh7IL+BW
         E66PCqzKKXM39dzvJG/5vQAY4Q6GKslyig7ktMrD2pnKs4TlqnVcjZCIBAfXpjDDi9UA
         M9ZTTlfkok64SL9B1bjUUd1NbcwDazSidl81OPTvoUZ6uQZ8PhzakvysmIFfAwRy8gLV
         KMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897428; x=1795502228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOsBTsM8HzI17SPUr1ak/9a9bMUvOh6RzD9t7xsTYQU=;
        b=QnmguHnyx+mRpusk05YorCl4gs8fOBrD3bwZYO+LOqag/5JhqXFABajiC6wp0TBgJZ
         rxX95rXnwjb2qI4m8iHYDXxzCh9O2ThNnvc0bVG9jR9fEy5ODjR5w0H3zoMkKUC0zmSw
         QeC4MURod6CbH8sbmdkoDWZZIcHBzUGlSsxzGZhw4tfg6VEQF7hUPgL4ZQRYe788bcKf
         HZ3PnzPUqHIOF7bsVsrMi/dWxkZ91u6tPkC+XEuotnTjGhvDVq+XiDLPSwh9K59xWeP/
         hmqKiNj4OVXSwiNcksDo/cCllwPFLEmlSYHSKgxo4sZ/nSbMl2SLyNLINHTAE73VL5KO
         PsIQ==
X-Forwarded-Encrypted: i=1; AL+hErGxiw2aNOmxsGmSnfqcn7B5fiay4hA50T/hvWFY0eBFBt4murmjE1aA+ykhv6diZW2XnK4PdvpkJDw8G5YSsdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UIjrnxfMEn7wqK1HGjL+lvFijE22SniWURp7kgtsVAjaAjMgc
	IvCUK0f28DRzwr6ABVun9e21VhGVJwRQd/jPS8gTIBDAU0eUwaV279uSIuxuPQ3qWmdVN0IiEc8
	VS8ntzFR1+TqhKiY0BG3w1vFhm2mx6nYyFCDwSlNESaTYOJA0bh2bctCV3P8Pr/Hrdw==
X-Gm-Gg: AYBFou3WIHN6LXtk4OOwAO8CgCG3j/07zeRKhUeshChkKKAoeQmQvzFv+pE2GypaxRW
	wTtJTe53sNw79TQvjF9wHuKtjce2P7WkwvryhTg8PT/Jap0+FymDWE5vFTzX4N4NIdxBhTlb1Ce
	kwcp8VjCVwkkAEsEEvSQqBt43gHolKvR7npuxNp4AcHMpZDz/dPUYGD1aDUk03TuU+wiZvophzM
	oOzSZAcDeWsvyyf/txrbmkZeX7z6I+0rFzl/axVqOTRXqo1ghbK4dRijuMFiqcO8109T3D+78a3
	0tDmg2JQqkLVgFilQXXdb7WLXIZmsPQm86HrJ/WPJeSHVZE3pi6oVsiRzA9+37YKfVD0Rlic8KV
	vQ4XT2qZ5RWyazwH6ImjBD+E9LtuWhmtxXnbsW+Hm9gNIsGBePeNJCdqWq1i6u/b8jW6taAHDNw
	TUYc//3g/4TFKxRzwynhw2fA==
X-Received: by 2002:a05:620a:2b46:b0:949:6898:2e4b with SMTP id af79cd13be357-94968982e92mr1269464985a.66.1794897427876;
        Mon, 16 Nov 2026 22:37:07 -0800 (PST)
X-Received: by 2002:a05:620a:2b46:b0:949:6898:2e4b with SMTP id af79cd13be357-94968982e92mr1269462185a.66.1794897427441;
        Mon, 16 Nov 2026 22:37:07 -0800 (PST)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d614b4sm104980356d6.18.2026.11.16.22.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:37:06 -0800 (PST)
Message-ID: <8092de9e-3146-4fe7-a235-01ea8efab08c@columbia.edu>
Date: Tue, 17 Nov 2026 01:37:06 -0500
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
Subject: Re: [PATCH v2] mm/madvise: zap markers from guard regions
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        David Hildenbrand
 <david@kernel.org>,
        Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, stable@vger.kernel.org
References: <20261113-disallow-uffd-guard-install-v2-1-9d0063c70542@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20261113-disallow-uffd-guard-install-v2-1-9d0063c70542@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L/qI0OT8 c=1 sm=1 tr=0 ts=6afbf614 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=nc3XcxN3xHuRbhElZrYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: h2uFJaQjiD7v13VxHLGfpUVprP7oz8kb
X-Proofpoint-ORIG-GUID: h2uFJaQjiD7v13VxHLGfpUVprP7oz8kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX18q0262nmwk2
 ZLV4v2uNjQUv4Odle1Df+QlMxc5hUGRNvyjb1ZnSJbLAMQUaZmOGk9JzK/GsJE7GU91b8nv1oWl
 +Uk+2WiCPORWGPySTzXd4Gb2AsBKDZBiiP51nApgV+FKlskpY8QoLp2O3nFFSayi7aixVaARYQZ
 SJpsNwHnAEhLOETFLFOJ3rnBH7MADoiwTzwasbPTRerQKTllhCB9egU+WWnlBsQvKkSHAU+Asiu
 nQ44I8UDt+82sOCJno9+qv+PR0PwUtDxIOTSy6CtyEyp6hjY+iKjaE7irs9Zwp3ziXpQ6URJPHJ
 0Vs9d709HUaxGDu4VuFO+4XL4YVZM9+kcd0Yct2nV2LpjKPDo+Tng0vKbfZgc5QcckmeeYUVfEu
 XCjn+r8BsPjfWW0IVAfIuLyqQ4iGN/PKslNdcxWEKUb9IGrHtavI7DmOS7/hzpyt8HkhOuAfeCW
 sr3u29gWm9wlcfRtf/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX7y6q4LQVRqy6
 6wOM7h5t3yEMJbY/kktGhacbrvscfEPXH8mZc0bYJWVcOtE9P9JE0a4Qs67J14RwH07jEdsnCz2
 N2pnCVy15aGU6YHuU/C7hKwHU5NJFGWFXQ4qE25092qdSo6pieBe
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 lowpriorityscore=10 adultscore=0 priorityscore=1501
 malwarescore=0 bulkscore=10 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

On 11/13/26 4:04 PM, Lorenzo Stoakes (ARM) wrote:
> In order to establish guard regions, guard markers are installed in the
> page tables of a mapped VMA.
> 
> However, problems arise when one tries to combine this with registering a
> VMA for userfaultfd, as such operations may themselves need to install page
> table markers such as uffd-wp.
> 
> When the installation is attempted the guard marker prevents these markers
> being applied, which can lead to unexpected results (especially if the
> guard regions are later removed.)
> 
> This is especially problematic because guard region installation causes the
> regions to be zapped first, meaning that the removal of userfaultfd-tracked
> ranges will not be logged in this case.
> 
> Additionally, the uffd-wp page table marker will be propagated regardless
> for file-backed mappings as the zap being performed does not clear these
> markers.
> 
> This is problematic, as it can cause repeated failure to install guard
> markers resulting in an infinite loop.
> 
> Therefore, update guard region installation to invoke the zap with the
> ZAP_FLAG_DROP_MARKER flag applied.
> 
> Both before and after this change, uffd remove events will not trigger on
> guard region installation, nor will write protect state be propagated after
> guard region removal.
> 
> This makes sense as conceptually, guard regions mark a part of a VMA as
> effectively unmapped at the page table level, and removing the markers is
> like mapping the VMA again, over which operation uffd markers would in any
> case be lost.
> 
> A survey of open source users indicates nobody is relying on installing
> guard regions in uffd-armed VMAs. Software including glibc, android,
> tcmalloc and CRIU were checked.
> 
> This change means that any already established guard regions are removed on
> zap. These will be overwritten with the newly installed guard markers on
> success.
> 
> However, if this fails for some reason (fatal signal likely the only
> reasonable cause), guard regions may remain removed, and concurrent faults
> may succeed in the interim in the range.
> 
> Since the installation failing guarantees nothing about the range being
> installed into, and since success overwrites with guard markers, this isn't
> an issue.
> 
> Since MADV_DONTNEED does something similar, abstract the zapping to
> zap_range() and call it from both places.
> 
Reviewed-by: Tal Zussman <tz2294@columbia.edu>
Tested-by: Tal Zussman <tz2294@columbia.edu>
