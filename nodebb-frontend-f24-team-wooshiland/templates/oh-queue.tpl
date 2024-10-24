<!-- Source: ChatGPT -->
<div data-widget-area="header">
    {{{ each widgets.header }}}
    {{widgets.header.html}}
    {{{ end }}}
</div>

<div class="row py-2">
    <!-- Main Content Area -->
    <div class="{{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
        
        <!-- Queue Header -->
        <h1>Office Hours Queue</h1>
        <p>Welcome to the OH Queue. Join or leave as needed.</p>

        <!-- Queue Status -->
        <h2>Queue Status</h2>
        <p id="queue-length">There are <span id="queue-count">0</span> people in the queue.</p>

        <!-- List of People in Queue -->
        <ul id="queue-items" class="list-unstyled">
            <!-- Queue items will be dynamically added here -->
        </ul>

        <!-- Queue Controls -->
        <button id="join-queue-btn" class="btn btn-primary">Join Queue</button>
        <button id="leave-queue-btn" class="btn btn-danger">Leave Queue</button>

        <!-- Pagination (if necessary) -->
        {{{ if pagination.pages.length }}}
        <!-- IMPORT partials/paginator.tpl -->
        {{{ end }}}

    </div>

    <!-- Sidebar (if widgets are present) -->
    <div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
        {{{ each widgets.sidebar }}}
        {{widgets.sidebar.html}}
        {{{ end }}}
    </div>
</div>

<div data-widget-area="footer">
    {{{ each widgets.footer }}}
    {{widgets.footer.html}}
    {{{ end }}}
</div>

<!-- Script to manage queue interactions -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const queueLengthElem = document.getElementById('queue-count');
        const queueItemsElem = document.getElementById('queue-items');
        const joinQueueBtn = document.getElementById('join-queue-btn');
        const leaveQueueBtn = document.getElementById('leave-queue-btn');

        let queue = ['Student 1', 'Student 2', 'Student 3']; // Simulated queue data

        // Function to update the queue status
        function updateQueue() {
            queueLengthElem.innerText = queue.length.toString(); // Ensure queue length is set as plain text
            queueItemsElem.innerHTML = ''; // Clear the current list

            // Add each person in the queue to the list
            queue.forEach((item) => {
                const li = document.createElement('li');
                li.textContent = item;
                queueItemsElem.appendChild(li);
            });

            // Disable the Leave button if queue is empty
            leaveQueueBtn.disabled = queue.length === 0;
        }

        // Initial queue update when the page loads
        updateQueue();

        // Join queue button functionality
        joinQueueBtn.addEventListener('click', () => {
            queue.push(`New Student ${queue.length + 1}`); // Add a new student
            updateQueue();
        });

        // Leave queue button functionality
        leaveQueueBtn.addEventListener('click', () => {
            queue.pop(); // Remove the last person from the queue
            updateQueue();
        });
    });
</script>
