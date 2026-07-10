Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49666823DD;
	Fri, 10 Jul 2026 01:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783648402; cv=none; b=G4+mGSZoLq4FQRvboZtEiGoYznPIGl+RoN4U0k2kFsLHXgZXeUVSjYs56kJTci1pe/Cxz7GZ4ZJrVhpcY4Ej27ousQrPROU9z0SpCOUYXq4ilLUEp9FkqnzZhvr13tIcyVYdRN58fDE5Yp+h9l5aWSrNWPwu1E0tEqrvYr4b5tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783648402; c=relaxed/simple;
	bh=sVzyVc0Ar9AEkdxmDgsE57UuEjYRJKFr4ca0kIDb8Co=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bhEheQFkYeoQjUIiB+dIJsZpTGLh+RIeuutAavtLzXA8QgW+pdWlCtMTSqNcpdDDkhzvHs60ZS+vhxJwS/hdhOHuIVhKwfXwDN1KM2g7gpVKPzTChCA1yVbyIQLgTGyhTlDdIUD0sxuaWpxmiMaMFk/SIK5sRaT+1hFkYMqf1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1b02jHio; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1b02jHio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9CB1F000E9;
	Fri, 10 Jul 2026 01:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783648400;
	bh=V5WePhdn0vM41AQZAytpqz+CRuhLkoEsVRrLRpGTVLs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=1b02jHioGv7QDp+jI0I5SMN7EUOkmf64ry1tpnm7kjslq1G5+6Gz1TDKTYLrC6j4T
	 MeIbQIL5Z5sRxDPbsmux03xqN4aybxaWzK47JWq6JiSmGh/7JvD3n1GSm48O6Duzfm
	 LAjyMiPqsIXOMpgUMlUhHRz4Dux9GpLIgLuMYxHg=
Date: Thu, 9 Jul 2026 18:53:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Ritesh
 Harjani <ritesh.list@gmail.com>, David Hildenbrand <david@kernel.org>, Zi
 Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain
 <dev.jain@arm.com>, Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org,
 Miaohe Lin <linmiaohe@huawei.com>, Venkat Rao Bagalkote
 <venkat88@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] selftests/mm: avoid false failures in hugetlb
 and KSM tests
Message-Id: <20260709185319.cbf0c39dd47ee3853d212b7b@linux-foundation.org>
In-Reply-To: <cover.1783446924.git.sayalip@linux.ibm.com>
References: <cover.1783446924.git.sayalip@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  8 Jul 2026 12:29:04 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> This series fixes issues in the hugetlb and KSM MM selftest categories
> that can report failures when the prerequisites for the tests are not
> satisfied.

Thanks.  AI review asked one question:
	https://sashiko.dev/#/patchset/cover.1783446924.git.sayalip@linux.ibm.com
