import { LightningElement, api, track } from 'lwc';
// import { loadStyle } from 'lightning/platformResourceLoader';
// import themeStyle from '@salesforce/resourceUrl/GA_SOS_VR_Internal';

export default class VrCustomPagination extends LightningElement {
    @api recordPerPage;
    @api totalRecord;
    @track pageArray = [];
    @api showPageSelection;
    @track currentPage = 1;
    @track pages;
    @track disablePrevious = true;
    @track disableNext = false;
    @api showPageNumbers = false;

    connectedCallback(){
        // Promise.all([
        //     loadStyle(this, themeStyle + '/internal.css')
        // ]);
        console.log('pages',this.recordPerPage,' ',this.totalRecord);

        this.pages = Math.ceil(this.totalRecord / this.recordPerPage);
        this.pageArray = [];

        for (var i = 1; i <= this.pages; i++) {
            this.pageArray.push(i);
        }    
        if(this.currentPage == this.pages){
            this.disableNext = true;
        } else {
            this.disableNext = false;
        }
        if(this.currentPage == 1){
            this.disablePrevious = true;
        } else {
            this.disablePrevious = false;
        }
        console.log('page Array',this.pageArray);
    }
    
    @api
    reloadPages(){
        this.connectedCallback();
    }

    @api
    recountPages(){
        this.currentPage = 1;
        this.connectedCallback();
    }

    
    handleNext(){
        this.currentPage++;
        this.dispatchEvent(new CustomEvent('next', {}));
    }

    handlePrevious(){
        this.currentPage--;
        this.dispatchEvent(new CustomEvent('previous', {}));
    }

    handlePageSelection(){
        if(this.selectedPageNumber && this.selectedPageNumber > 0 && this.selectedPageNumber <= this.pages){
            this.currentPage = this.selectedPageNumber;
            this.dispatchEvent(new CustomEvent('pageselection', {detail:{pageNumber : this.selectedPageNumber}}));
        }
    }

    handleInput(event){
        this.selectedPageNumber = event.target.value;
    }
    
    
}