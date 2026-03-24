Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A993CA4B1;
	Tue, 24 Mar 2026 23:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774396567; cv=none; b=LTQxrOjI71hJn131dfR07hrZW+Nh3aG7Qk7/tgQ0sIUWq5asgi5N1xz4fwFSGi/v5i53SxDNS8yVXX3ureVf8UTTJDJZALR/r7SAGvslUdJsz4g29oExMwSmtYgShT6vhYLRoL5ZZ9A/ewk0CJm74fN8bvxScJbjXlVR8ANOW8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774396567; c=relaxed/simple;
	bh=4uNybzToUKp0EAa2ve7IC4o/Ki+L3VO4Pq1iJB1BAU8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Y9WFExIwYrLbMA14jbbjTxXTMfExgsyJIAxAHif540dNJUqvbT3gKd3tbmw2kpIgi2XIcI3gWbYbo1SRCC4gaV5uHwyfm0FzdXaNni5EfILdPpbqJLXZUPNJt/ONnCfKQk5HLUfUdl+6Vj7wgur4qt3TCyfseiG1vdrWjdLa4F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PBp9KCP+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PBp9KCP+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C5FC19424;
	Tue, 24 Mar 2026 23:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774396567;
	bh=4uNybzToUKp0EAa2ve7IC4o/Ki+L3VO4Pq1iJB1BAU8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PBp9KCP+HTB22gb2kXON2RUvZihG+skEDsleFplTuA9hcaKXm0c7btgBY7E+je8tg
	 NG+mNtn94cmgHl2PQb/6bKQe+GDc2rtIqwKbuAtwmQF4eWKkM2znUoOTCvCkChd8Kv
	 KFtbZGAhe4u4GFoI17yLq9TIJObhfUfcF+yGHKds=
Date: Tue, 24 Mar 2026 16:56:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Shuah Khan
 <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>, Zi
 Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain
 <dev.jain@arm.com>, Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 09/13] selftests/mm: skip uffd-wp-mremap if UFFD
 write-protect is unsupported
Message-Id: <20260324165606.d75200ac0e5458a5ffb83d5d@linux-foundation.org>
In-Reply-To: <0e9cea41-7c49-446a-b67b-256584960516@linux.ibm.com>
References: <cover.1773305677.git.sayalip@linux.ibm.com>
	<ed23ff57a80881c9d087d22709862af40addf49b.1773305678.git.sayalip@linux.ibm.com>
	<457dddf1-04ec-4d1e-8640-b04997fac4f1@kernel.org>
	<0e9cea41-7c49-446a-b67b-256584960516@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Mar 2026 19:56:01 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> >
> > Because right now it reads as if it would be returning a bool.
> >
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> >
> Thanks for the review. I'll rename it to
> "check_uffd_wp_feature_supported()" in the next version.

There was no next version.  I added this:

--- a/tools/testing/selftests/mm/uffd-wp-mremap.c~selftests-mm-skip-uffd-wp-mremap-if-uffd-write-protect-is-unsupported-fix
+++ a/tools/testing/selftests/mm/uffd-wp-mremap.c
@@ -19,7 +19,7 @@ static size_t thpsizes[20];
 static int nr_hugetlbsizes;
 static size_t hugetlbsizes[10];
 
-static void uffd_wp_feature_supported(void)
+static void check_uffd_wp_feature_supported(void)
 {
 	uint64_t features;
 
@@ -347,7 +347,7 @@ int main(int argc, char **argv)
 	struct thp_settings settings;
 	int i, j, plan = 0;
 
-	uffd_wp_feature_supported();
+	check_uffd_wp_feature_supported();
 
 	pagesize = getpagesize();
 	nr_thpsizes = detect_thp_sizes(thpsizes, ARRAY_SIZE(thpsizes));
_

