Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EBE2FA0C7
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774215314; cv=pass; b=jw2lIyu0qiOFfMdOHZusOJmRXvEDLLI+i1ZbfOnPVGxb9INf8fj8Z4NbtK2u5GDNamLpndRkZPSeazNHbZhX9yEB2yhgU0OcMexjgWvZ4yEenhbLxqC+0KBaGbJOHRa2IzmA2KLwuc8qnGJK2llzY4Ika8bxqTdizpCmpXlaZT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774215314; c=relaxed/simple;
	bh=gApkGcqVPgdcTYd4jmdPtaYkG896cUuh/RvuIah88Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlUmOxESJqq+GnJ7k7+mrBJ/gbmx0HmR9tWiCQo769B8qYdsyDikBjO69IzY9KBKVD/BOJUTCq1v9FF6apjirCX8nNR4f6Ej1swjVprkz8Cg0nnkktSZoJExnQnThqkL3ZKd/uP+nXLiAUuuaLl8ERTatCM0MxAbIlAUSxjzWcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N/pusFke; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N/pusFke"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so84465e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 14:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774215311; cv=none;
        d=google.com; s=arc-20240605;
        b=WA6JfYwbFhhLK6a+fgD18XMnK2MJeiKKua0Ukagj3Y/n7vtSJxlFeHgClXOSN29RLU
         H3vRTJvlMJPUFzLKiW0W7oP6oPMsNaFFiG6eF4eB1q8jJW75Gp7azbvPUcTmsMz1KQ0S
         iSJTBnnZ2taaKZ7VsK1CdPAcCxT4pJi7RtT3/TDOST01L5zsBZ35Q+zr3fdhyZw22CvV
         zuc81qCBe/2hoxGWT3sQFzuyhFvJD25nAnprQIwYvMYtHsNcXLUs2byzAMIF8vEsHCb/
         dDKh3jM9PIEZ2pIs0UrN/b0r23ssFPlwcH4IRcytt6v4CJEmZe0Z5YC4a4yD2AWNXew/
         M3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QTIWcKBW9Y8RO9y4afCKJvIbF+a9wcxS5pN6QSrPCVs=;
        fh=ok9neOQ4ZcvigU7d5hzmsvhhHyHA9Cr7IqPOzA3spHE=;
        b=DJ6dqNbUf+KhwD9OHqUaa3hOLJeraqQcEBCEN5hLQxyAF1NzXHkU0znfBewRnnfGP+
         6OlE9t0Lkai1UOayZ5IKWVff60atl1m5dolQtCEuCd8+uE3ATwtd46aHh8pzN+lX7/TH
         JF+lj/I5IsUAzbv7NPXB+qUz61FQxkWrkaMU2jcFOg6WAUfphftz7tRr52prpYM3yTi9
         jVK0VhExwl0uSxzS59zOroBY9G0v0MuGcldWWSwI9op5CA2bJxFxz8sITZOSUtdISpe2
         aqyqMVAlzheAIXcmFcEgglKpUkcI6XN8cxNu1OtUVFDNPtQXwTIQJw6qRy/0Qga2INaU
         WDUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774215311; x=1774820111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTIWcKBW9Y8RO9y4afCKJvIbF+a9wcxS5pN6QSrPCVs=;
        b=N/pusFke9AK91UCi3IwyeLdAdi+EA3lXR27UMWNY2xtvDj/wxmu2dePcxAkgQLO43a
         H0LHQYfr9W+VqSllale6ahZZIR0/K6UxkLLG7EmucfChoXXPc9+Jy3y7Z9KXC2ap1WyJ
         MmvkkPzGD/G5Esvyp810O8hDD6HqH4iR0w94b7oLpZVX+inAyWt6n8FsotvEgXoY+u9J
         tYeScjDFlv8izq1mkESOhlQ8vDxPWIOzNnHUQMB1Ye0oAKGMMLUqxixLRHT+jhiWMfnt
         9ZpKvrr9YzEfI/kTl5ee+TH2JZg2wVT9gOAPqQKJAmpbHLOTdvuv4+Bn1GgCmFRT1k8t
         VqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774215311; x=1774820111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTIWcKBW9Y8RO9y4afCKJvIbF+a9wcxS5pN6QSrPCVs=;
        b=rYLXNsROYz91BwoejISX6k4+Qw3oTNZcLVVOlcqjHMawT6BuNR3JfHGT3MxLQqdrqB
         oUSU96JoT+TBPAJXI6BBo0p1WhvqRiiucOVXWQXuPQmWB1CHFMY1GUvO7L1Vhi+jqEO/
         REkV/ooVugPEc+3gdglrTIjw0+tw9GagEJlbhK8mg5QX2AQkpDg5IfbxutUmohqsknqB
         YPyYqJdrsdIKxdMmZSYkCgtW/s2CTxVyroWQP5QTTPTwSnnarBAIb3pRKJppgb6PToyA
         cqZgTz1pdw6JMwD8KP1P4EfdDXwk8qvzb46gOmDrXNCtoQcDZwBId4BnB9m+Fy3566TD
         rwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJQu2feq/UY2lhsHZJu03ZiZPFgtXc/o0OMHmplx1Z+gPFGxYc0FiahGcmuEx8GpALdIbgbFbAug4EidNQiNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO1hJM+/4aGyS+D0haGStOGs/Mg3/m5heFc8nTUdk8soitLo3l
	q5i/i5FSCCIMR+jBP5h0s2fSVGdhP9PvrdzA0YL6B3JQ8WU7i4gWrC6lvDTJxd43mZZVf3ng+ef
	eX+tcYvWaxzXWVtSWIfgRPsemDNIEmSKP7AKi2pXF
X-Gm-Gg: ATEYQzw7fqxJTptYybEbBRMKRJBJze4wYpROydv2AhnNtuZGIQtLL3L7dbF+iwslF8w
	biTJLOSZq9n1VSARi5ymkINKCYusjpC9FiFILKyQ8OpdhCgBxHxrmXynlvTd8z1SR+FSyWKT1EA
	tDGirIKnPzqDptYSsU7P0ynWf1eqV8TEnAGtOMPUgnAY2lVHVt+9JzhxLpCq3Go8QBTBkTn3Zam
	xv3ZKLFzjnClDWElLZhC6Z61ewNI2WtQCq9a7vkJdK29OXlKwswog4mVgNqWm/m8mZMNS4SEGEn
	r7AZNnlejEugZ6VYiHlnNZJ4FBa/PQz3ZnBJH2Ro
X-Received: by 2002:a05:600c:a215:b0:477:c5b3:7a9b with SMTP id
 5b1f17b1804b1-48703466f53mr1053425e9.10.1774215310721; Sun, 22 Mar 2026
 14:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
 <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-1-92c596402a7a@google.com>
In-Reply-To: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-1-92c596402a7a@google.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Sun, 22 Mar 2026 14:34:59 -0700
X-Gm-Features: AQROBzD6br59NzV_GjGVBt5AZrKUozD0iHX3HE9KQlgwQBNQ-oe36lFLzYaFGVs
Message-ID: <CACw3F50mVpnS7TQy_pD-KV=_Ekepjq00zZzdGxwLnF_vYT_M0g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/7] mm: memory_failure: Clarify the MF_DELAYED definition
To: Lisa Wang <wyihan@google.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rientjes@google.com, seanjc@google.com, 
	ackerleytng@google.com, vannapurve@google.com, michael.roth@amd.com, 
	tabba@google.com, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 4:30=E2=80=AFPM Lisa Wang <wyihan@google.com> wrote=
:
>
> This patch clarifies the definition of MF_DELAYED to represent cases
> where a folio's removal is initiated but not immediately completed
> (e.g., due to remaining metadata references).
>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> ---
>  mm/memory-failure.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index ee42d4361309..4f143334d5a1 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -862,9 +862,10 @@ static int kill_accessing_process(struct task_struct=
 *p, unsigned long pfn,
>   * by the m-f() handler immediately.
>   *
>   * MF_DELAYED - The m-f() handler marks the page as PG_hwpoisoned'ed.

nit: would it be worth correcting PG_hwpoisoned to PG_hwpoison'ed? as
there is really no "PG_hwpoisoned" page flag.

> - * The page is unmapped, and is removed from the LRU or file mapping.
> - * An attempt to access the page again will trigger page fault and the
> - * PF handler will kill the process.
> + * It means the page was partially isolated (e.g. removed from file mapp=
ing

nit: what about "unmapped"?

> + * or the LRU) but full cleanup is deferred (e.g. the metadata for the
> + * memory, as in struct page/folio, is still referenced). Any further
> + * access to the page will result in the process being killed.
>   *
>   * MF_RECOVERED - The m-f() handler marks the page as PG_hwpoisoned'ed.
>   * The page has been completely isolated, that is, unmapped, taken out o=
f
>
> --
> 2.53.0.959.g497ff81fa9-goog
>

Reviewed-by: Jiaqi Yan <jiaqiyan@google.com>
