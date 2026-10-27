Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104722;
	b=SpQUi5p3Cc7uGz0R028cMRCQfGgVxSjPJJWugypBOhqwCnvGHzHFGArezXx0F3DLtxx9
	 T1hbfH4rNG7kmXhibOuUxVjgNZg0AyWJGh4BX/FkSpefy+9CQFeyhmLY/5PPDXOLlmHyt
	 ERA5dSJHPAJ8fqTbT3DMwmyClKkIaNNiVfVoum6lWo0jI2LLKERy4dxlSdRq77Ffauxgw
	 5NazvgQWkkWArGPAcnwBe/p69FjPwASR2AQiOYAMB7BqoYnHzzROQshh9mHyTLvjQ9BIF
	 Z9OevR5+5ZyXZCeopzNoGmGj3oe5Bic9+s1UJaIuLTta8xtMFQOsTKjVq+ZtOpQeolg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104722;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=k+2t1cyvTHNrJyCbVMQW5rekaM6HtX5EkecAGatJW+o=;
	b=I3yJkMtnhA+UetBgzlfP/tE5+w4REFENTsu4FV72UTC8aO+b+6Z9cjwxDsqDUwVYdii4
	 e3QGNLA11f9THnQ/qoa/paSb0t0MFoz0xxem6HRwQdhpmKhRxjev6eo81lHsXp8fWEYhh
	 QnEI4ZRwQ7N5ZkdbbYokcx0blx8MMTkGw7H18zsKiFfa9UMvNMYr/QHfX7b+yz31dX+ln
	 sppTAgrScEr956lGqWg4E4mFvDq3xvkF1yKQmGVxMpU/6mDaQSd5cWqv4M4dX+Iw9fHNd
	 V9M6eDeV0jV6uKpd8uhT16+FUFMGy43s42AhFU6yNfaneTHNrQFFkfoAww+4NjwO9pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWd0KxDa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0860A261E;
	Tue, 27 Oct 2026 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWd0KxDa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894DB1F031E4;
	Tue, 27 Oct 2026 12:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793104721;
	bh=k+2t1cyvTHNrJyCbVMQW5rekaM6HtX5EkecAGatJW+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DWd0KxDaK80pFuGqi90D4Nrp/O3Ay03rJVOcphlqDOpC5VwyooaMvPqtWSp7jcmOZ
	 lmtgIXSFL0cTE6mastyBXTv6cbOhzZ/7VWbHCt1yHtWAYgYpaXQOMMwafaE9Wq7lNO
	 llXJcTBFPjXt7iVvR3aWg8MbFbet73ELyp15wqg6WrA4PdpdvP7wA9J7bGrrVbOoGr
	 5VevwKY56KtvoYOk/g75qeX/6LhmyLcsSVuIGmD8JvM0sMDPBz9nruinq01rtU1Ust
	 HCKfQEUALjKYYA7rOu5rPQOnGy28tIIUuwqVDLwm3B4y+d7ifl0lNs7WsB0xocKHtI
	 3cgk4VtI0GVrw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 5825B198003A;
	Tue, 27 Oct 2026 08:38:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 27 Oct 2026 08:38:39 -0400
X-ME-Sender: <xms:TJvgak7JmRXSu5-X0Vdx9dcpIvf3ek5Qv3ccgTrK5K26CpZ09mW5dg>
    <xme:TJvgap0RaWPiLmBjI62Az9VRBesF0YOk-44p0b7RPnkAnfwFA8iHjubvdCn6IE0_f
    m0P00MdGHpAaiVg-nILXlX4ic1_W7u6wEXMIw1j0kQcodEJP-OiH1MV>
X-ME-Received: <xmr:TJvgar_NCGVhRTQ2gbWsHcxqKHeURzgP5Ky51kfmdxfUNHpuVyDGw0nyiuM>
X-ME-Proxy-Cause: dmFkZTFifNxF028tALiGBKVlh5Wy369MFPvYrj+99z7meFDB4RuiCUvj+DHIXqgXLIkCRn
    Q5TfW2Ea4AadTP3BtEjnoJG9TfURWYAWABlivX1ELh3+o3jlP3JbW5Z+GpCVf1ffF5O+JA
    RmA9DEKwKtT5+xShVrI/I/VUqcHsFsoYGBWTqAy23txKKKzUM+onqOvZLsU8TdVtJP4sNv
    ilZmCYPik+0kxktvG2u51a1liN8ZL5kGnlnLPqZ2DztMrPAbmms4mbDFVQsF1jwC3/NR+c
    v3Rkmyi4U27GqOzNMueyo695aZuHP58GJiOlPm8QHawcowZl17/kwyU9rbFZa56/RzCHZl
    nuDRVEy0Z0vA4R0t0TnaTi/b7snEFTXk+yVLC4bvUyBibMZ7+//zYmPQolg+Ve9k1Y8Jv5
    0tXp7K+ik8shGmUeFJuP+9R8YL5+NLXdykQC5X05s7xaE5Bem001Kt93cAYEZZYOnrriJV
    vvl6fSVBdHhh8YFhpiMyrU9vpt3EPJoRSGXHneUgNtoQqHiwgZOE3fl8gKjmvAoc9Fr6HY
    cXNWM5ppuUUoSBkTkNALo9rP3Brj+k95DE7sd3ueNQR/b87RVLwID2LTHk/N5h5Du/th9x
    TJnRY5oDK174qwrwit2pJ6C7DZ0I2DZQ+9xXHxPV2OPeXv1Mh8PgqGmPEfPg
X-ME-Proxy: <xmx:TJvgaitFia2BledahPcZx-R4DD1WuEaphsLwEIyLo5k-7Fv7bTvWww>
    <xmx:TJvgavpnAxQA-G6o8IEmGJsS9zvlg0t4INOvnqCC9kf9DCbf3ZyIog>
    <xmx:TJvgalHznjoNqsYjGYjHVHWl8DsGNN6ur4vT-7WiacXhKG029p_XxQ>
    <xmx:TJvgaq6F5aDKBTyU10Bq1MMpCEVHee22NHlqnYRbiFvwwnn9kamgtQ>
    <xmx:TJvgagBu3jBlt7weUEH_FyYjoLZ-l3wF-36MkLyg8_gw1ObMny_E8yNV>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Oct 2026 08:38:36 -0400 (EDT)
Date: Tue, 27 Oct 2026 12:38:35 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com
Subject: Re: [PATCH] selftests/mm: fix khugepaged_race build with older glibc
Message-ID: <auCbOg62Ym4Ic-qj@thinkstation>
References: <20261027122013.4286-1-zenghui.yu@linux.dev>
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
In-Reply-To: <20261027122013.4286-1-zenghui.yu@linux.dev>

On Tue, Oct 27, 2026 at 08:20:13PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> glibc versions before 2.37 do not define MADV_COLLAPSE in <sys/mman.h>, so
> khugepaged_race fails to build against them (e.g. glibc 2.34):
> 
> [root@localhost mm]# make
>   CC       khugepaged_race
> khugepaged_race.c: In function 'main':
> khugepaged_race.c:506:23: error: 'MADV_COLLAPSE' undeclared (first use in this function); did you mean 'MADV_COLD'?
>   506 |       hpage_pmd_size, MADV_COLLAPSE);
>       |                       ^~~~~~~~~~~~~
>       |                       MADV_COLD
> khugepaged_race.c:506:23: note: each undeclared identifier is reported only once for each function it appears in
> make: *** [../lib.mk:225: /data/code/mm/tools/testing/selftests/mm/khugepaged_race] Error 1
> 
> Include <linux/mman.h> to get the UAPI definition of MADV_COLLAPSE.
> 
> Fixes: 66c374464438 ("selftests/mm: add khugepaged race harness")
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>


-- 
  Kiryl Shutsemau / Kirill A. Shutemov
