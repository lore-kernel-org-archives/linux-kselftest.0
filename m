Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F1428857
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836937; cv=none; b=tHgRf9eLMYxwPaBjB9z0zytq8XpU/CjoUtSgbR7iGkOUxco0pyRsiQ1TI/1MMscH4wz74AmP8zL5eHcTvCrqRAG1+hOnrdALvS/uFbCzDqJI3Q2kcNJr7rW6tSvnHT/XoQeKihAwbHhgVSdiCq5+NRa7C9vWkFDOHCA6/CmvWfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836937; c=relaxed/simple;
	bh=LHuH38OYYSxE9/VQcwZgKysoFQxWuBx4gzsB5o3h7aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrKTk05uenn/z6duA09pAipLUPso/ebEyYAEUSmlE6ri6LeceKN0zGyMcpvuDADjENHvLkrYeUS7wRSxvA6/6hY2GP8UPcVzBCd6uy4u4D8LvcXsResnnu58UTWcY1NwTn2LaNbfhXja7Kps9Cl1IrWW0kfTyOtVEUvXUblCA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaVdkOZj; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaVdkOZj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso1387099a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 02:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778836935; x=1779441735; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZB7dXJdMz2m27jS4oJrp4Xa0e7eQPlOm8RhL6/Zm48=;
        b=IaVdkOZjgLn4No7s1OX0TJNqO41vIVcTL04nzT5nuCyHAUYKsq84JQNTaBbQxQ02Bv
         2LF+C5jR70PUiwO3f1Ps0gAUXxUcQAFGtH2j8BkaRkMecLU/KGvah4UqeFQnlOOrTNiY
         a5NlZDHURt/+dOX/miGuol+aURPwdZt5JxWkiSsDmibLVpL+cPTU0X5caYz9VC6ciWzM
         27aObvicx3QOmX9PvjksUTMDhg5j9UZP7mxEUA/MAjOfN1xiBlFAIkPtRG50XF5jrnDJ
         bhYwfepYLOntKdLBFhLUTZED+MolA6iEy+Mh83cQ9qeNAvd4gty62WpQsEKc0Tsue86r
         +/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836935; x=1779441735;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZB7dXJdMz2m27jS4oJrp4Xa0e7eQPlOm8RhL6/Zm48=;
        b=KiVUCr/7uLueP++VHHyVYGHbaLMZ99jp8lOyPr5ekNwcEI1ExAlNv6Tl2KdmxN1dDm
         QJiU92qflQdn30WgOV3Odgrso0IRMSMteQrUXMXVyrHuXuef1ny6T9xbzg3dSWektYZ9
         NLH7ChgFPdjfNnr7si7aO47jmyX/hIZQCmVVMNixQ01pTaHXwpK44h4evZEhu8LuD2Tz
         cIyKYOAcAZiTc+Ukc4HNBV6Jzp2vCHhA2rud7lbx5SGFuKmfCV0bSdv7o8R7on4H+3DS
         cJk0sqn4O4FmqAo1xsxBTnzEpcOXnLuuW6dp1QILb6WhwqNfbHDz7K9wWBqNwNmmRdZX
         1Img==
X-Forwarded-Encrypted: i=1; AFNElJ+LS614adftS+KZEIhCBWqtW3d7M/+4e1th0chI5e1yFFmckcV6oeD1VdvkucCBR6Emg45pa4HoZFagcbQnBSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbjzidMe5iSXZaPtUXYZ7njwCgnf5f6dQjMB6hdgTpHIFdypq
	PY7Of6HE5Htggdji5OkuXm0ET5P1T2RbDFTWUneNLR9jZ/5TwCIRIckP
X-Gm-Gg: Acq92OEHdwh19XudskOuZDoxHaKJ7EHC551kdWoALxpRUjFdaIhSGBFIJUOJ4MdawD3
	1JWB02JRD6V5fu/25j3zdwy5O2oialc8NpFyU7OtZQgL4Ch2ze/33QaL86//ErCga6tpl8Q0NSg
	+afwJxXcGH7EACaeSr4bpU43s4AGfhPdFJN/HT0guenxCft2Wwe52OepAIjtYVVsrpMbOeHOf3F
	wYbS7MVl+vRKBrjfkfYv0bsGsiML9e6nUvtAGZFuoT2HHs3I04JhVrHMdxDf/a5GQf6jm3RDzhe
	XeETeHgZNCenmLklG6M+47IwTqso1ncSLwxmpa9TMg3CPOuzMbHKg1d3Usn9ofNqbu4Jhe1eEKn
	PmUEZM0EavRhh0Q7aBi/ctkFUijNUGxNeDt1hQbulnwjZfRTqz30U4pvuyYMNYFZwinn6ZfUf54
	9+KLbvvrOiMFxpiDWmlUqCug==
X-Received: by 2002:a17:907:9614:b0:bd3:99fc:5610 with SMTP id a640c23a62f3a-bd4f3503c54mr412050166b.30.1778836934495;
        Fri, 15 May 2026 02:22:14 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311769040sm1743357a12.24.2026.05.15.02.22.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2026 02:22:13 -0700 (PDT)
Date: Fri, 15 May 2026 09:22:11 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Vineet Agarwal <agarwal.vineet2006@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: check file initialization writes in
 split_huge_page_test
Message-ID: <20260515092211.qkmaxcofxwfdexld@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260512074924.27721-1-agarwal.vineet2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512074924.27721-1-agarwal.vineet2006@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, May 12, 2026 at 01:19:24PM +0530, Vineet Agarwal wrote:
>create_pagecache_thp_and_fd() fills the backing file for the
>pagecache THP tests using repeated write() calls, but the return
>value is never checked.
>
>If a write fails or completes only partially, the test may continue
>with an incompletely initialized file and produce misleading results.
>
>Check the result of write() and fail the test if the expected number
>of bytes was not written.
>
>Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
>---
> tools/testing/selftests/mm/split_huge_page_test.c | 13 ++++++++++---
> 1 file changed, 10 insertions(+), 3 deletions(-)
>
>diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
>index 500d07c4938b..eab69b0f59a0 100644
>--- a/tools/testing/selftests/mm/split_huge_page_test.c
>+++ b/tools/testing/selftests/mm/split_huge_page_test.c
>@@ -609,9 +609,16 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
> 	assert(fd_size % sizeof(buf) == 0);
> 	for (i = 0; i < sizeof(buf); i++)
> 		buf[i] = (unsigned char)i;
>-	for (i = 0; i < fd_size; i += sizeof(buf))
>-		write(*fd, buf, sizeof(buf));
>-
>+	for (i = 0; i < fd_size; i += sizeof(buf)) {
>+		ssize_t written;
>+
>+		written = write(*fd, buf, sizeof(buf));
>+		if (written != sizeof(buf)) {
>+			ksft_perror("write testfile");
>+			close(*fd);
>+			goto err_out_unlink;

Maybe we can "goto err_out_close" and remove the close() here?

Apart from this, I found on error writing to /proc/sys/vm/drop_caches in below,
it just goto err_out_unlink, which left fd open.

How about fix that at the same time.

Generally, the change look good.

>+		}
>+	}
> 	close(*fd);
> 	sync();
> 	*fd = open("/proc/sys/vm/drop_caches", O_WRONLY);
>-- 
>2.54.0
>

-- 
Wei Yang
Help you, Help me
