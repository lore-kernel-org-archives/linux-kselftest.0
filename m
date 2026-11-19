Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113533;
	b=rw9jhL+V/QtqxohOekBAfoszbO7KhyJn7HtUGwurA+6Pqff+fg+JraQ2n5FdCvQZZd3R
	 FmMDDnNU+zTAUts1mVyAj4x3sWXbk8ABDngK4W5yPCvqXrRUXj10+UMdIF7oUTHVJ4jWU
	 FZcggLaixlag6k/aSJd7rHZUb8eGKu2mykWSYVdGx/jKFNcSxokGrem4+7B6dOuN5k2N7
	 BOG/kVWxK34hZcteU3/pcvOhElBuA5klQxCu7I5re8vbZg7czZJGUy4BK/ytosaopUPa6
	 VM6H/Z7yVylexihz1lmp3RjvYHtjZbbnunIZq4tXqG6LmDEnsK6YHTRcp5RzgCLtQig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113533;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=2iQ0+2zXaYo8rBW1GuAj8YJKBX93rhlTN+lHKRkNO2k=;
	b=FLi5gscP5zO/Wj8qlbnbFI0zY4U0ZtQVIfJD/In+Tl5jdBmoEG0r0uQ6XH3L5YMjVbGf
	 Ib5RRm6bh/pJEO6viln80gFfGR6dBlRJ3jl+rei2Knyb7HMTKW+3p7cSr9ps072dPtyjd
	 5RnqJJUzyO650fbk5p1IIjPZQLZVPbOXMFtFf2tm47Sgc/C+LbprBl79s9A+kvq6f0M+P
	 jGo4B0ouRTijpiZXJqIVykrDgnZMd5k35tQ7PxB87qKL06i2tcesZV/zSmnYUNgtmlmlx
	 5eJGXcqDtIl0tr5K3uWo1I/gycZ/HUvt/nW4Ra1WqCNd4WXA9vw8J9rkUVYxTyTnfZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvmSX7Hc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FF4606A324;
	Thu, 19 Nov 2026 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvmSX7Hc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CDE1F000C5;
	Thu, 19 Nov 2026 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795113533;
	bh=2iQ0+2zXaYo8rBW1GuAj8YJKBX93rhlTN+lHKRkNO2k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OvmSX7HcrPPojaHOsd8NleIm2QS/jlCNMIe69IhvmdlCp3xKGXevQNai3c5PWEhxP
	 kIaL8l3fUXCeUiH0LNCQ+X6kZwm5F3Dpc2i/PMstTdqP/nukUfU0b85PvAMxwF0LI2
	 heLb7Igind9TbtSXW+JFsUQswMaxQaFrf632hY2qIp07pZS7QEa9wlDGpb/24a/qnw
	 DU9iWW/loeye7T2UAzXxuqLow/iuGATHu1vfCouJLbrzX7fVu8aT+AsQoZabwkYUxj
	 Ui24b2/nklqI0U2yGVklRIgdVEwDdoqd/PYq/9l2I2QlHTnZdVQeWcEZDXxKwbCTYW
	 5hT5R8giR7ceg==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Christian Brauner <brauner@kernel.org>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v4 04/19] liveupdate: Allow file handlers to mark
 retrieve failures as retryable
In-Reply-To: <20261111002358.1842967-5-dmatlack@google.com> (David Matlack's
	message of "Wed, 11 Nov 2026 00:23:42 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-5-dmatlack@google.com>
Date: Thu, 19 Nov 2026 18:38:47 +0000
Message-ID: <2vxzmrr43buw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 11 2026, David Matlack wrote:

> From: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> Add a retryable output flag to struct liveupdate_file_op_args, which a
> handler's .retrieve() can set on error to tell LUO that it hasn't
> consumed the preserved state. LUO then lets userspace retry the
> retrieve, and .finish() still releases the preserved state if the file
> is never retrieved.
>
> When luo_retrieve_file() invokes a handler's .retrieve() callback and it
> returns an error, LUO currently records the error in
> luo_file->retrieve_status and blocks any subsequent retrieve attempts.
> This is necessary when the handler has already partially consumed or
> freed the preserved KHO state.
>
> However, with user arguments passed to .retrieve(), a handler may fail
> early while validating caller-supplied parameters, such as a missing or
> invalid argument, before touching any preserved KHO state. In such
> cases, userspace should be able to fix the argument and retry
> LIVEUPDATE_SESSION_RETRIEVE_FD.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
