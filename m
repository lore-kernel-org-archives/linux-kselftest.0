Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0812E40DFC1;
	Fri, 20 Mar 2026 02:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773974766; cv=none; b=QyFQUesMOO/JWRa0DkTpovYISfca3fiXQe6AvzYYEMs/P9gX0LBbB9yg6xHa4AxQhQlKsL8Qgsveiwobel4SeuHOMGveyWq37kIc6EHiyQh4zo5UeKSrirdxxRa/39bgoDKpeXKz4+XdWlO1SkPeb+VdnrpdMpQ+xm89+wyDkbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773974766; c=relaxed/simple;
	bh=YunpBLhttoCZ/wIAcy4nfrL4p7VGWHFXXCquZN24h8o=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=X7X9blmp9xVR/Wap+Em0Hl8G4mdHnPIb34+jyn8xQRmmBcmwXW7yohYSrjjEarAySd56+eBPoxnqau7Hg4rZU+bL3vkL/AUoEFlpvQ8vRlU9r6LlGSGPV0lTzzffOVi4iTBBYQ/hRwntyqrcVTac/NQYji0I1Mvu9j61i9VYDfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=czaTvFVh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="czaTvFVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CDDC19424;
	Fri, 20 Mar 2026 02:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773974765;
	bh=YunpBLhttoCZ/wIAcy4nfrL4p7VGWHFXXCquZN24h8o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=czaTvFVhyni42YpuVBn1vWRh3Ky008Qc+XQuV8/+XFzKKmLC4NNt+pmObYqOsPzqK
	 yh8tyZF4bDmbUAUWMBZ/hcGG+vgyAVxgnPloZ0wgZwj/PxinC+3kAEOQZY8h/2UFMo
	 NRO4j9fuAShXnW+lMiJxKYTnE90r7LTXL5dGkcXs=
Date: Thu, 19 Mar 2026 19:46:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v4 0/5] selftests/mm: skip several tests when thp is not
 available
Message-Id: <20260319194604.0a9a733f521caf2dc2bf18c8@linux-foundation.org>
In-Reply-To: <20260319160656.1480279-1-chuhu@redhat.com>
References: <20260319160656.1480279-1-chuhu@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Mar 2026 00:06:51 +0800 Chunyu Hu <chuhu@redhat.com> wrote:

> There are several tests requires transprarent hugepages, when run on thp
> disabled kernel such as realtime kernel, there will be false negative.
> Mark those tests as skip when thp is not available.

A couple of questions from Sashiko:
	https://sashiko.dev/#/patchset/20260319160656.1480279-1-chuhu%40redhat.com
