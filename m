From: joel@joelfernandes.org (Joel Fernandes)
Date: Fri, 19 Oct 2018 10:57:31 -0700
Subject: [PATCH v3 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <42922.1539970322@turing-police.cc.vt.edu>
References: <20181018065908.254389-1-joel@joelfernandes.org>
 <42922.1539970322@turing-police.cc.vt.edu>
Message-ID:
 <CAEXW_YTS2n2tOpXs3eVQZhYu7tmM_at0ZBA-04qYkHw4UE80nw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181019175731.McwZ6HJ7mGwK0TpiwrlmtbhNZURP5tEPS8_iK5mZv8o@z>

On Fri, Oct 19, 2018@10:32 AM,  <valdis.kletnieks@vt.edu> wrote:
> On Wed, 17 Oct 2018 23:59:07 -0700, "Joel Fernandes (Google)" said:
>> This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
>> To support the usecase, this patch adds a new F_SEAL_FUTURE_WRITE seal
>> which prevents any future mmap and write syscalls from succeeding while
>> keeping the existing mmap active. The following program shows the seal
>> working in action:
>
> What is supposed to happen if some other process has an already existing R/W
> mmap of the region?  (For that matter, the test program doesn't seem to
> actually test that the existing mmap region remains writable?)
>

Why would it not remain writable? We don't change anything in the
mapping that prevents it from being writable, in the patch.

We do test that existing writable mmaps can continue to exist after
the seal is set, in a way, because we test that setting of the seal
succeeds.

I could test that processor stores can continue to happen my doing a
memset into the existing map, but I feel that is like testing 2+2 = 4,
in a way ;-) Do you really think its worth testing? If you do, then I
could add a test for that.

- Joel
