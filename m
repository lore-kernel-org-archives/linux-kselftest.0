Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD54B37FF52;
	Tue, 17 Mar 2026 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773772651; cv=none; b=XJS4pVpwNMsooYoPo/3uWaFNM4j8OhFDhyQcwAHXASalj8uy6xnPyQ+p5yliQBJ/KA2fG2l/2Zul09oknlg8If2rJKrzYIbxoQQx3UNKTGk/QxfryfwU51sD2R8JY+sedO0ovxYKDVQ4kB1SrFaVlCXUCaFzfAxmXFBvuJ2RGIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773772651; c=relaxed/simple;
	bh=X1fPag/Ma0Or3n9BwLwG0BHnymxAfli1gvz6SmhvgXc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jobimD2zLSFbl3Dv2qFEIj+bK1cw39+IZi7iVun8J2JTWj8mRllPjD2CPvhnOCgDSLO5kwo3qkmaHHM8jiQ6ZtIf8uYUUWOdwqIfXyZtrnyDezoWjFKkNHbfZOK44phfvEmN9MlGiiLpFbolg4m9koiXy08Bu9mQkW/anP5+NOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xBLlVrZS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xBLlVrZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2CDC4CEF7;
	Tue, 17 Mar 2026 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773772651;
	bh=X1fPag/Ma0Or3n9BwLwG0BHnymxAfli1gvz6SmhvgXc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xBLlVrZSOfM9FPIB0k7xOsujepC5gsf6N9xIoEhu0lP7W7dyGaurgbK030QQFBJLG
	 uvPeZNqE/I/Hpo6HjsIoE2XzGgo2h0w/sf9uQIYKx7uXY/WKXYI1NsikK3REwoNNky
	 L+q5URynkmWbhbeuvVKmsijD61veTJYwQWSeDvI4=
Date: Tue, 17 Mar 2026 11:37:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v3 0/5] selftests/mm: skip several tests when thp is not
 available
Message-Id: <20260317113730.45d5cef4ba84be4df631677f@linux-foundation.org>
In-Reply-To: <20260317094419.1429259-1-chuhu@redhat.com>
References: <20260317094419.1429259-1-chuhu@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Mar 2026 17:44:14 +0800 Chunyu Hu <chuhu@redhat.com> wrote:

> There are several tests requires transprarent hugepages, when run on thp
> disabled kernel such as realtime kernel, there will be false negative.
> Mark those tests as skip when thp is not available.

AI review asked some questions:
https://sashiko.dev/#/patchset/20260317094419.1429259-1-chuhu%40redhat.com
