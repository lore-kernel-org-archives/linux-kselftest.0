Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8D312825
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 02:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159105; cv=none; b=uLOX69u+AGVs1EaEzUX/6rVZsYUz363UVp4gc4SaWf1D7fuNpzzz74D8EGnmVThtkdmXwSwnEUDKYUDHeLIXgOJ1+IA7Tm8nnBt4u3UJaU62Q6brb7q9Ewdn7nFogvLGXF3NctVclu6RGi8SWDARJOLvOT12gNocqbMtbIekEp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159105; c=relaxed/simple;
	bh=4oGT1ayBDkwYn3Qr/LaW+fN6OEZZOIq/CCNtj+5nbvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YE2h+Joe/6GPoGXtGEHs462/xJheicWM/kHNLkSVTsMmuuGyMPpxyRk5EvQJ9g9+y1HvOhd7Gmws3sFYEv74UEMsnyphAVzBlzfFFNBSbu0WP4mjYUWwPI52socAVH+9Du8ax4nmiye28yZj75LfLnTvs3zRAPm3GP43klmJzdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTtOFDpz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTtOFDpz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so2637507f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 19:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779159102; x=1779763902; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUvEeG4/QGY098FJMB5ch64NaoSvyes0bxvJyMtkahY=;
        b=aTtOFDpzGkOExIOjas1ec+WbGZq9qIcD2K2nZHTKr/4shMPfeftc/arap4ouJYGYGM
         F6ziBxBLRf7QybeEIBbzHjUMvNbYaFHy07iUp0UnrEvB8ioLn4UVNo75bfRwVkhjqcXt
         TzPL+wDi7URtTZwcN6V74s9OBT3JqLzQE0eJGmHFnU6OzWBTHz8V2HPbDBYjE15u4uTu
         SIrTzRTmd9JesTNDZPyv7S8jGDZEeGbJT57fXCcHp9pLBz0JxViwoRdQOTWuD1uEzFDE
         H7kDr2BaLPb+Cg7UfOWJq3WsfH9ETfiWbi5rvveyXceYmrGrubM7ZVLybA4faWqtDho9
         jUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779159102; x=1779763902;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUvEeG4/QGY098FJMB5ch64NaoSvyes0bxvJyMtkahY=;
        b=IX2pMNfmPjl3TDKZDj0pbJ1z8JCnxcxkdpmxcgud1XOA4VhCh5oFwOaDq2W5ds1kgS
         CzcG1JBBV+bo4P+qIzl+rnbfw6mqXPTjqgax7MGym1ZoVu/pJcVF+/Ig8kzVxg5dHZnb
         t8b/0f0f3Zckm0B4YWc+juKBGTe8lud5ztRaOKIaQSrNXijiWEcBW8aZt1hha1KhRF6H
         vDPRGqlcyEn6VAN4/LUzwTfKc4qgKLogjsRLHtTkehKBdeLVT75I1+K+IRwy2mWEsAlJ
         I/4KDkT5wTGGbHnFMbub2Bm8/80lrbrO9Xc80osdXqaue8w9q4VzvOhTsx9NafQiyyCQ
         eEgA==
X-Forwarded-Encrypted: i=1; AFNElJ/PuS3euLvTCXwIum5zSF+NPLeEsJnOXXeOzcAPvKVqiMOOQ0UmesZh+n/T8B+NUiFZeVoDUoprtCW+qUNEIO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEs6T8QO5oxvqEMJ+PJsNZe7pi2pENhgRzlMGmdFegGWPbu6k4
	J1LCgHuuuLxFS776SXV7cJz8vnNAJhKStMEnbHKko54dMBEOH8K+D7gF
X-Gm-Gg: Acq92OGCH4nVZfEidWaJqJCV4qFq46Fio5Wsl03fbB5ISNohVo4bPoI+PxL/B2wOBt+
	esIokmWdymOGKWhJU5ZasBAGsAX9JAI9Zl+HNfYeRdDkeHblD/DOLzfu/F3ne6jlVpgItrlLPCp
	EOPH9IiEfgFnam4j6FLEUbRF8p3VLO/neYCjKt9u6B2f0ZZEyySODSWZa+X6NIpH1o84TprWNkp
	la51+Rqi19+8SFiMF7MBmOCd8fIcnKzz6PbCihrp8iBjp64MmzfhCW/8tuMbDNMGrA/qqOyAk6O
	qzWZ0c+xpuuipCOFzA+85W2sLO/mo/dsrKE1mv00qNXANdGSAhkK5cauGYKL96jpjemxijt6k2B
	2J0pJ1d4Enz7WEK/dBrnrRhJflmqEWOiVa18BhVBGgFtgd5UTvso5pjYCT5ut3+MU+7O4lxzaYF
	XG3nr/QK+rlQWUqXkIuS7E9Q==
X-Received: by 2002:a05:600c:5010:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48fe5388407mr256024315e9.12.1779159102140;
        Mon, 18 May 2026 19:51:42 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm319672855e9.9.2026.05.18.19.51.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2026 19:51:41 -0700 (PDT)
Date: Tue, 19 May 2026 02:51:41 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yang <richard.weiyang@gmail.com>,
	Vineet Agarwal <agarwal.vineet2006@gmail.com>, david@kernel.org,
	ljs@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: check file initialization writes in
 split_huge_page_test
Message-ID: <20260519025141.lguv7mrtvqgqpltc@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260512074924.27721-1-agarwal.vineet2006@gmail.com>
 <20260515092211.qkmaxcofxwfdexld@master>
 <20260518163553.447a45c54a3d419b9bb916ca@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518163553.447a45c54a3d419b9bb916ca@linux-foundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, May 18, 2026 at 04:35:53PM -0700, Andrew Morton wrote:
>On Fri, 15 May 2026 09:22:11 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> On Tue, May 12, 2026 at 01:19:24PM +0530, Vineet Agarwal wrote:
>> >create_pagecache_thp_and_fd() fills the backing file for the
>> >pagecache THP tests using repeated write() calls, but the return
>> >value is never checked.
>> >
>> >If a write fails or completes only partially, the test may continue
>> >with an incompletely initialized file and produce misleading results.
>> >
>> >Check the result of write() and fail the test if the expected number
>> >of bytes was not written.
>> >
>> >Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
>> >---
>> > tools/testing/selftests/mm/split_huge_page_test.c | 13 ++++++++++---
>> > 1 file changed, 10 insertions(+), 3 deletions(-)
>> >
>> >diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
>> >index 500d07c4938b..eab69b0f59a0 100644
>> >--- a/tools/testing/selftests/mm/split_huge_page_test.c
>> >+++ b/tools/testing/selftests/mm/split_huge_page_test.c
>> >@@ -609,9 +609,16 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>> > 	assert(fd_size % sizeof(buf) == 0);
>> > 	for (i = 0; i < sizeof(buf); i++)
>> > 		buf[i] = (unsigned char)i;
>> >-	for (i = 0; i < fd_size; i += sizeof(buf))
>> >-		write(*fd, buf, sizeof(buf));
>> >-
>> >+	for (i = 0; i < fd_size; i += sizeof(buf)) {
>> >+		ssize_t written;
>> >+
>> >+		written = write(*fd, buf, sizeof(buf));
>> >+		if (written != sizeof(buf)) {
>> >+			ksft_perror("write testfile");
>> >+			close(*fd);
>> >+			goto err_out_unlink;
>> 
>> Maybe we can "goto err_out_close" and remove the close() here?
>
>AI review suggested the same:
>	https://sashiko.dev/#/patchset/20260512074924.27721-1-agarwal.vineet2006%40gmail.com
>
>And it complained about the handling of short writes in the added code.
>
>> Apart from this, I found on error writing to /proc/sys/vm/drop_caches in below,
>> it just goto err_out_unlink, which left fd open.
>
>Not understanding - cab you please describe more completely?
>

I mean do this below.

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 460fa1f606fd..f30402ece608 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -469,7 +469,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
        }
        if (write(*fd, "3", 1) != 1) {
                ksft_perror("write to drop_caches");
-               goto err_out_unlink;
+               goto err_out_close;
        }
        close(*fd);

On error writing this fd, /proc/sys/vm/drop_caches, we forget to close it.

>> How about fix that at the same time.
>> 
>> Generally, the change look good.
>> 

-- 
Wei Yang
Help you, Help me
