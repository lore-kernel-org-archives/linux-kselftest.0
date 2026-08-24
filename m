Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3E379C5E;
	Mon, 24 Aug 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558360; cv=none; b=DDNYYlYPbOrpBZ/YEy4JrGCErhK4uoEmbwxkS58mpfExWYw3FNzrUDO72sy2AwxN3bmFv/EbyE4DVF5s8zULh+INOLd3Tonvjl9SPlyWxaHUF5As5TdYzqG1ZrhErV1POzN5OVV/Ie6jGgYbJHkSEildAN5wAgrJKUt8/aW075s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558360; c=relaxed/simple;
	bh=xs83ViXcY4b8VCVAiurJ+VoBeJqaftU6PlOIOuGOebc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BBW+qVGpmSH4rtGnAwhrDzJiYOHkjZUT7VT+Fiajc0JgxtvVdBx9faNvc3E62tuAb8IzzB8lDt/cZPxE8cFTZrbNVfOUJgdGCWA6BVt7rUjdN+PW0h/xiFoCTMqPl6P3bO+dQ15sSVgSkcNoncXsdIgiaIbDpFGkUxYx2BSd25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmA9km/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmA9km/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C661F000E9;
	Mon, 24 Aug 2026 07:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787558355;
	bh=jlCrxymSsXh+tyzlFmElD0tkq0tcVy6WfjHyPiQmTo4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kmA9km/VBI+guT1+n6nq+sV0kYYpGsW38wJpCGOE0xoyuTzbdifAn63TJBt2nr82u
	 jjJWb3PqtkloIwVH5rPrUt41EokVtWB+gSKog/ZV9mtq0UCqllleAW9+eJle1kPVyN
	 0OaOEhllsLOGr8ykfppFUezdigisBGi0EeIXfV8hOQIflmpTm07SDP1rqK5FMC5eMJ
	 /RqrO9ZZO0FFYAXT/bd+mFUyveay4xdukMai0Q6wd8WXbFmo60aCT132D+Yam+icoE
	 zI7eiRzfqnKfuKuO0OUGPY6V1fOdlzRB6B/ubfQt0hAg3YNbQFmu8HJg02QrXQYBde
	 N9ON59Rq8YStg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 1/6] selftests/mm: make file helpers return errors
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260813181230.483746-2-sarthak.sharma@arm.com>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
 <20260813181230.483746-2-sarthak.sharma@arm.com>
Date: Mon, 24 Aug 2026 10:59:05 +0300
Message-Id: <178755834509.3606540.837800416127261846.b4-review@b4>
X-Mailer: b4 0.17-dev

On Thu, 13 Aug 2026 23:42:25 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> Change read_file(), write_file(), read_num(), write_num() and
> write_num_ignore_einval() in vm_util.c to report failures to callers
> instead of exiting from the helper.
> 
> Make read_file() return a negative errno on failure and 0 on success, so
> callers can distinguish a successful read from an I/O error. Also make
> read_num() reject negative and malformed values.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

