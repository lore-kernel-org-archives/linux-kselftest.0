Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747303328E3;
	Tue, 24 Mar 2026 23:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774394605; cv=none; b=ApeRpW+bRE51dm3HChTRmdY6PZt9yFe3HEm4mRFicAolt5Zgo71m8OET5NV47YU6XHxM3izo5VDtHUDbJEQxzzcwpoi5rUe+HgkfTQKMuJpDDUejIofoWxpXDb3l/RltlOoAxAdqEs27zxse4yd1UnANVl4fKyAR6pL+UreWhqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774394605; c=relaxed/simple;
	bh=GirE4UWJ2LcK2wAzlGa+tmQTxh+/DadBCRMtX6wLQFQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OK8Tt+wMedKbtNoDClAEWvIQFTDXQNrBs3+M3GnAZEA9xTqg41DgnrZ/qSOhN9asBR5C7rpXJbwuE0UE3gA6w4w+JlMmQxIEI6DCdB/SfHssQl0bY3F4g7cPuYZLxeLdQ0d5TLOS91Vje8biHSHpBztJolJK8v0asgonwrMNIIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PQzi39UL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PQzi39UL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A87C19424;
	Tue, 24 Mar 2026 23:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774394605;
	bh=GirE4UWJ2LcK2wAzlGa+tmQTxh+/DadBCRMtX6wLQFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PQzi39ULuF7qCf3+iwmKHcywjTfN2jiKoaYaOR4lgOFzAKRAK+thutR4Ur1XXyVUF
	 wPeb6A1Ckbg9FaAG1ow3/U2Dqq6XVvBIpvQWsKMwp9ruz3yALSfSfrS3glnJ9lP4Pz
	 kM5CmATBipFDUV9C9xBk0Y8HdgM1U3jFGQ2IB8Uc=
Date: Tue, 24 Mar 2026 16:23:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Audra Mitchell <audra@redhat.com>, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 usama.anjum@collabora.com, colin.i.king@gmail.com, avagin@google.com,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-Id: <20260324162324.6efa49422d145afd4dd37dda@linux-foundation.org>
In-Reply-To: <a4fb1d56-8c10-46de-acf5-9a00ce0db4ad@kernel.org>
References: <f7fef55d-4334-4d1d-b6c6-b409fea7e2a1@kernel.org>
	<20260320184010.759461-1-audra@redhat.com>
	<20260320184010.759461-2-audra@redhat.com>
	<a4fb1d56-8c10-46de-acf5-9a00ce0db4ad@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Mar 2026 12:56:33 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> > +		supported = __pagemap_scan_get_categories(fd, test_area, &r) >= 0;
> 
> You have to cast it to a (long) first before comparing, like we do in
> pagemap_scan_get_categories().
> 
> 
> Maybe best written as
> 
> 	long ret = __pagemap_scan_get_categories(fd, test_area, &r);
> 
> 	if (ret >= 0)
> 		supported = 1;
> 
> > +		ksft_print_msg("errno: %d\n", errno);
> 
> I guess we should drop that, was mostly for testing.
