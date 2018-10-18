From: daniel@iogearbox.net (Daniel Borkmann)
Date: Thu, 18 Oct 2018 22:14:26 +0200
Subject: [PATCH bpf-next] selftests/bpf: fix file resource leak
In-Reply-To: <1539875916-28560-1-git-send-email-peng.hao2@zte.com.cn>
References: <1539875916-28560-1-git-send-email-peng.hao2@zte.com.cn>
Message-ID: <bd7de92a-e638-f122-0f44-c8c2250d300e@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181018201426.pCUSxJV9RHV-EmWTikkTZPON3hpzdC3VAnTlSaw9ZUc@z>

On 10/18/2018 05:18 PM, Peng Hao wrote:
> FILE pointer variable f is opened but never closed.
> 
> Signed-off-by:Peng Hao <peng.hao2 at zte.com.cn>

Applied to bpf-next, thanks Peng!
