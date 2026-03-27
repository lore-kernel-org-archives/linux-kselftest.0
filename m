Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A633FE36;
	Fri, 27 Mar 2026 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635065; cv=none; b=VWJgwUvP0VuFx78iGVRME5fYaODXNrf01NuTIc5OhtEN2VOA7V5cNsv9ljVoWxA0kc/jaWC8vkxvg8Av87KNIhZPhP7sRli8K+710rNqWwc11X9HnRg05huRmUe4FFZs87rFXaKiwHYrwDq9NZW60En2laQjingS+Ml880lqhjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635065; c=relaxed/simple;
	bh=D3tgGfmxSUuIKrF23B6dFn44AdNk1562eNoc2kIzF0g=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Cpk9EAreLtKJvXpe7YkJ3wNtSdg8z9SD5+5Dhn0pp/yyY8RCO8RxUl+todO6tKFtiuaqYUUfQh+3MHGYtH6zmhsvPDQhH6rNkLE7/NGUP6bn63E1RAWr1+TvUy+ENkqZsDGKk4sXhnlmztpqrRqLpCJPHQf8S0SlVT8AgGw9nfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cdYOayuP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cdYOayuP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94449C2BC9E;
	Fri, 27 Mar 2026 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774635065;
	bh=D3tgGfmxSUuIKrF23B6dFn44AdNk1562eNoc2kIzF0g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cdYOayuPJYi2aaxhAmAFgppjg5NFHZRBdYAYmVT0UcRjcTZjflLB/FGXTUb9V3lJx
	 OgYT97I6nd+lwOsBPiBlUFP0OCrdat5FF+6ghCrli/AY5UhTyMpR/3xUnK2jyN4H6W
	 38fwnTH1RNgXYVSZcfyBJ0jwwTiW+dxnu/XqmhNw=
Date: Fri, 27 Mar 2026 11:11:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Ritesh
 Harjani <ritesh.list@gmail.com>, David Hildenbrand <david@kernel.org>, Zi
 Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain
 <dev.jain@arm.com>, Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 00/13] selftests/mm: fix failures and robustness
 improvements
Message-Id: <20260327111104.b8bc18be45172639f5b9226f@linux-foundation.org>
In-Reply-To: <cover.1774591179.git.sayalip@linux.ibm.com>
References: <cover.1774591179.git.sayalip@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Mar 2026 12:45:54 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> Powerpc systems with a 64K base page size exposed several issues while
> running mm selftests. Some tests assume specific hugetlb configurations,
> use incorrect interfaces, or fail instead of skipping when the required
> kernel features are not available.
> 
> This series fixes these issues and improves test robustness.
> 
> Please review the patches and provide any feedback or suggestions for
> improvement.

AI review asks many questions:
https://sashiko.dev/#/patchset/cover.1774591179.git.sayalip@linux.ibm.com


I never knew about that bash line continuation thing.

hp2:/home/akpm> cat t.sh

foo=\
	bar
	
echo $foo
hp2:/home/akpm> bash t.sh
t.sh: line 3: bar: command not found

Huh.  But it presumably passed your testing so confused.


I don't want to risk breaking selftests so I'll set v3 aside until
you're confident we should proceed.

Thanks.
