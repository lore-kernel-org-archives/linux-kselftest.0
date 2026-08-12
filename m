Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F7F34B1B0;
	Wed, 12 Aug 2026 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542162; cv=none; b=Zz5n8PtzCFuIFRvVtzej6KEA9e0IpY9EaGUESLP7sF9UrZCv6cGSnpO+EfKvc3Uh6aDH2pjdDTpt9NED7Sywtv4CHd3VNA0lOHqU24ESfJAN2iimrSCPpyuf2KEgMoHrZydbVCWp3ellef86udqHzK1a23GUJ4M72orS7wu4fsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542162; c=relaxed/simple;
	bh=X67QmUBHGHm+AiDWb87m26v38I2dGADVP9e2iTQRS20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLXRu2IvJess1WIAwg2N3qn9lv+7Gc5+njkd0Fn13KDCelc2loVyDR2DEcevrTxDnl/UhXEZ7y/in+B+ux+dionG1g1hoNmVjHm6b6ru8jiuI9J6jkcrs7pZPGKh5TpQtMibhaPtaPFv+qgFcYJv9A5LGnY1Vjwe2f1YoqUsfog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWKzH0r+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWKzH0r+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538911F000E9;
	Wed, 12 Aug 2026 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786542161;
	bh=Ir7XnZTfnKiE1NV6eZ+BZ1phE3SdBSyJA2vS3hmoEBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CWKzH0r+k35uq/gBzVBizUYYZ2YhQI2uDduyLZc+iUOmijU4V9LzofSbavHnWDumE
	 2zrnoXlZquLrxgtfJeUKT2QSxYTD3krlTBcv5z7PZLVmb8pW66nSaNyiw115Xp966F
	 NR/DWTYd+BP0Sx+MDHHthdceL3kWv8zhCWjD7+N0CBCmeBGEMDS38bEDiQu1JxQKtr
	 IvsCSrgMzGSzTsghoh56hHQzzlULSODd6GvbtFdXNp4tL0C7xIcc9FGVj8zGJu34in
	 NJuLdbxDYtrHj+s8hRvHE4lfySVAalgKQmz7wSUrDAjxLsMV5RxCC78Y4W1scuTreX
	 qZsvJO1cKiSgw==
Date: Wed, 12 Aug 2026 16:42:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, shuah@kernel.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	peterx@redhat.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests/mm: emit TAP header in uffd-wp-mremap
Message-ID: <anx4SbvfHXOHVflm@kernel.org>
References: <20260812120821.523860-1-husong@kylinos.cn>
 <20260812120821.523860-2-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812120821.523860-2-husong@kylinos.cn>

On Wed, Aug 12, 2026 at 08:08:19PM +0800, Song Hu wrote:
> uffd-wp-mremap calls ksft_set_plan() with no preceding ksft_print_header(),
> so the "TAP version 13" line is never emitted and the output is not valid
> KTAP.  The sibling uffd tests (uffd-stress, uffd-unit-tests) print the
> header first; do the same.
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/uffd-wp-mremap.c | 2 ++
>  1 file changed, 2 insertions(+)

-- 
Sincerely yours,
Mike.
